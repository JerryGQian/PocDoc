require "sinatra"
require "./controller"

#
# Constants
#

PORT_LOWER = 1
PORT_RANGE = 48128
PORT_DEFAULT = 80
CTRL = Controller.new

#
# Helpers
#


# logged_in : -> Boolean
# Returns if user is logged in with correct session identifier
def logged_in?
	session[:user] and CTRL.authorize(session[:user], session[:session])
end

# get_layout : -> Symbol
# Returns correct page layout depending on login status, basically
# just changes the navigation links
def get_layout
	logged_in? and :page_user or :page_visitor
end

#
# Configuration
#

enable :sessions

set :public_folder, File.dirname(__FILE__) + "/static"


configure do
	port = PORT_DEFAULT
	set :port, port
	set :environment, :production
	set :bind, '0.0.0.0'
end

not_found do
	status 404
	erb :not_found, :layout => get_layout
end

#
# Routes
#

get "/" do
	if logged_in? then

		if params[:p] then
			locals = CTRL.get_messages(params[:p])
		else
			locals = CTRL.all_messages
		end

			all_users = CTRL.get_users

		erb :index,
			:layout => get_layout,
			:locals => {
				:twits => locals,
				:paitients => all_users,
				:current => params[:p],
				:token => CTRL.assign_token(session[:user])
			}
	else
		redirect "/login"
	end
end

post "/" do
	CTRL.publish_twit(
		session[:user],
		session[:session],
		params["content"],
		params["token"].to_i)

	redirect "/"
end

post "/webmessage" do

	print("message #{params["content"]} recieved\n")

	CTRL.create_message(
		params["user"],
		session[:session],
		params["content"],
		params["token"].to_i,
		"doc")

	redirect "/?p=#{params["user"]}"
end

post "/appmessage" do
	CTRL.create_message(
		params["user"],
		session[:session],
		params["content"],
		params["token"].to_i,
		"pat")

	redirect "/"
end

get "/login" do
	if logged_in? then
		redirect "/?p=Andrew"
	else
		erb :login, :layout => get_layout
	end
end

post "/login" do
	sess = CTRL.authenticate(params["user"], params["password"])

	if sess then
		session[:user] = params["user"]
		session[:session] = sess
		redirect "/?p=#{params["user"]}"
	else
		redirect "/login"
	end
end

get "/register" do
	#if logged_in? then
	#	redirect "/"
	#else
		erb :register, :layout => get_layout
	#end
end

post "/register" do
	succ = CTRL.register(
		params["user"],
		params["avatar"]["filename"],
		params["avatar"]["tempfile"],
		params["password"],
		params["confirm"])

	if succ then
		redirect "/register"
	else
		redirect "/register?failed=true"
	end
end

get "/logout" do
	CTRL.revoke(session[:user], session[:session])
	session.delete :user
	session.delete :session

	redirect "/"
end

get "/search" do
	locals = { :query => nil, :users => [] }
	locals = CTRL.search(params[:q]) if params[:q]

	erb :search,
		:layout => get_layout,
		:locals => locals
end

get "/prefs" do
	if logged_in? then
		erb :prefs,
			:layout => get_layout,
			:locals => {
				:token => CTRL.assign_token(session[:user]),
				:user => CTRL.get_user(session[:user])
			}
	else
		redirect "/login"
	end
end

post "/prefs" do
	CTRL.update_prefs(
		session[:user],
		session[:session],
		params["description"],
		params["token"].to_i)

	redirect "/prefs"
end

get "/user" do
	erb :user,
		:layout => get_layout,
		:locals => {
			:user => CTRL.get_user(params[:q]),
			:twits => CTRL.get_twits(params[:q])
		}
end

get "/messages" do
	erb :messages,
		:layout => get_layout,
		:locals => {
			:text => "succ"
		}
end

get "/home" do
	erb :home,
		:layout => get_layout,
		:locals => {
			:text => "succ"
		}
end

get "/retriever" do
	erb :ret,
		:layout => get_layout,
		:locals => {
			:messages => CTRL.get_messages(params[:u])
		}
end

post "/retriever" do
	erb :ret,
		:layout => get_layout,
		:locals => {
			:messages => CTRL.get_messages(params[:u])
		}
end
