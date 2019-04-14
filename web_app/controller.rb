require "digest"
require "securerandom"
require "sqlite3"

#
# Constants
#

AVATAR_DIR = "./static/avatars"
SESSION_BITS = 32
DATE_FMT = "%d %h %G at %R"

#
# Helpers
#

def sanitize (input)
	return Rack::Utils.escape_html input
end

#
# Sessions
#
# The Sessions module handles session identifiers, integers
# which uniquely identify a user on a particular client.
# Once issued, these identifiers will automatically be stored
# in a cookie on the user's browser. We keep track of which
# identifiers belong to whom.
#

module Sessions

	# issue_session : -> Integer
	# Returns cryptographically secure session identifier.
	def issue_session
		SecureRandom.random_number(2 ** SESSION_BITS)
	end

	# assign_session : String -> Integer
	# Assigns a session identifier to a user and returns it.
	def assign_session(user)
		@sessions[user] = issue_session
	end

	# revoke_session : String -> Integer
	# Revokes session of a user and returns it.
	def revoke_session(user)
		@sessions.delete user
	end
end

#
# Tokens
#
# The Tokens module generates and assigns tokens which are
# attached to user input forms as a hidden field. A new token
# should be assigned to a user on GET requests (where the
# page has a form).
#

module Tokens

	# issue_token : -> Integer
	# Returns cryptographically secure token.
	def issue_token
		SecureRandom.random_number(2 ** SESSION_BITS)
	end

	# assign_token : String -> Integer
	# Assigns a token identifier to a user and returns it.
	def assign_token(user)
		@tokens[user] = issue_token
	end
end

#
# Access
#
# The Access module handles user authentication and authorization.
# We verify the user's identity by matching up the session identifier
# the user gives us (as a cookie) to the identifier we issued for that
# user at login.
#

module Access

	# authenticate : String String -> (Integer or NilClass)
	# If credentials are valid, assigns session identifier to user
	# and returns identifier, otherwise returns nil.
	def authenticate(user, passwd)
		user = sanitize(user)
		
		actual = nil
		salt = nil
		
		query = %{
		SELECT Password, Salt
		FROM Users
		WHERE User = '#{user}'
		}
		@db.execute(query) do |user|
			actual = user[0]
			salt = user[1]
		end
		
		if !salt then
			return nil
		end
		
		hashed = Digest::SHA256.hexdigest (passwd + salt)
		
		if hashed == actual then
			assign_session user if get_user(user)
		else
			nil
		end
	end

	# authorize : String Integer -> Boolean
	# Returns whether user was issued given session identifier.
	def authorize(user, session)
		session == @sessions[user]
	end

	# revoke : String Integer -> (Integer or NilClass)
	# Revokes a user's session so long as given session identifier
	# is valid. Returns the session if valid, otherwise nil.
	def revoke(user, session)
		revoke_session user if authorize(user, session)
	end
end

#
# User
#
# The User module handles all user-creating, modifying, and
# data retrieval actions.
#

module User

        # search : String -> Hash
        # Returns a hash containing the search query and the set of
        # users matching the query (by name or description).
        def search(user_query)
				user_query = sanitize(user_query)
		
                users = []
                query = %{
                SELECT User, Avatar, Description
                FROM Users
                WHERE User LIKE '%#{user_query}%' OR
		      Description LIKE '%#{user_query}%'
                }
                @db.execute(query) do |user|
                        users << {
                                :name => user[0],
                                :avatar => user[1],
                                :description => user[2]
                        }
                end
                { :query => user_query, :users => users }
        end

	# register : String String File String String -> Boolean
	# Registers a new user if they don't already exist and
	# password and confirm password match. Returns success status.
	def register(user, filename, file, password, confirm)
		user = sanitize user
		password = sanitize password
		confirm = sanitize confirm
						
		return false if password != confirm
		
		query = %{SELECT * FROM Users WHERE User = '#{user}'}
		@db.execute(query) do |user|
			return false
		end
		
		salt = SecureRandom.hex
		password = Digest::SHA256.hexdigest(confirm + salt)
		query = %{
		INSERT INTO Users(User, Password, Avatar, Salt)
		VALUES ('#{user}', '#{password}', '#{filename}', '#{salt}')
		}
		@db.execute query
		true
	end

	# get_user: String -> (Hash or NilClass)
	# Gets user preferences of given user or nil if non-existent
	def get_user(user)
		query = %{
		SELECT Avatar, Description
		FROM Users
		WHERE User = '#{user}'
		}
		@db.execute(query) do |user|
			#raise ("input: " + passwd +  "\nhased:  "+ hashed + "\nactual: " + sav)
			return {
				:avatar => user[0],
				:description => user[1]
			}
		end
		nil
	end

	# update_prefs : String Integer String Integer -> Boolean
	# Update preferences of given user returning success status.
	def update_prefs(user, session, description, token)
		description = sanitize description
		
		if token != @tokens[user] or session != @sessions[user] then
			return false
		end	
	
		query = %{
		UPDATE Users
		SET Description = '#{description}'
		WHERE User = '#{user}'
		}
		@db.execute query
		true
	end

	def get_users
		
		users = []

		query = %{
		SELECT User, Description, Avatar
		FROM Users
		} 		

		@db.execute(query) do |eps|
			users << {
				:pat => eps[0],
				:description => eps[1],
				:avatar => eps[2]
			}
		end
		users
	end

end

#
# Epsilons
#
# The Epsilons module is concerned with creating and retrieving
# twits. These are the little messages that make up communication
# on our network.
#

module Epsilons

	# publish_twit : String Integer String Integer -> Boolean
	# Publish twit from user with given content. Returns
	# success status.
	def publish_twit(user, session, content, token)
		if token != @tokens[user] or  session != @sessions[user] then
			#raise "bad news"
			return false
		end	
	
		content = sanitize content
	
		#raise ("good news: " + content)
	
		timestamp = Time.now.to_i
		query = %{
		INSERT INTO Epsilons(User, Content, Date)
		VALUES ('#{user}', '#{content}', #{timestamp})
		}
		@db.execute query
		true
	end
	# publish_twit : String Integer String Integer -> Boolean
	# Publish twit from user with given content. Returns
	# success status.
	def create_message(user, session, content, token, mode)
		if token != @tokens[user] or  session != @sessions[user] then
			return false
		end	
	
		content = sanitize content
	
		timestamp = Time.now.to_i
		query = %{
		INSERT INTO Messages (Patient, Usermode, Body, Date)
		VALUES ('#{user}', '#{mode}', '#{content}', #{timestamp})
		}
		@db.execute query
		true
	end


	def get_messages(user)
		user = sanitize user
		
		twits = []

		if user == "" then 
			query = %{
			SELECT Patient, Usermode, Body, Date
			FROM Messages
			}			
		else 
			query = %{
			SELECT Patient, Usermode, Body, Date
			FROM Messages
			WHERE Patient = '#{user}'
			} 
		end

		@db.execute(query) do |eps|
			date_str = Time.at(eps[3]).strftime(DATE_FMT)
			twits << {
				:patient => eps[0],
				:mode => eps[1],
				:body => eps[2],
				:date => date_str
			}
		end
		twits
	end

	# all_twits : -> Array
	# Returns all twits.
	def all_messages
		get_messages nil
	end

end

#
# Controller
#
# The Controller class defines a single interface to all the
# previously defined modules. It holds the server-side state
# of the application as well as the database handle.
#

class Controller
	include Sessions
	include Tokens
	include Access
	include User
	include Epsilons

	# Leave @db as attr_accessor or you will fail the tests!
	attr_accessor :db

	def initialize
		@db = SQLite3::Database.new "data.db"
		@sessions = {}
		@tokens = {}
	end
end
