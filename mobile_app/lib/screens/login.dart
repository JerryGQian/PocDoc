import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'home.dart';


Future<void> _loginPost(BuildContext context, String username, String password) async {
  var url = '34.73.57.190';
  var response = await http.post(url, body: {'username': username, 'password': password});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  var sessionID = int.tryParse(response.body);

  if (sessionID != null && sessionID >= 0) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => HomeScreen()
    ));
  }
}

class LoginScreen extends StatelessWidget {
  TextEditingController usernameController = new TextEditingController(text: 'Username');
  TextEditingController passwordController = new TextEditingController(text: 'Password');

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.orange, //or set color with: Color(0xFF0000FF)
    ));
    return new CupertinoPageScaffold(
      backgroundColor: Color(0xfff7faff),
      child: Container(
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100.0, bottom: 80.0),
                  child: new Text(
                    "pocdoc",
                    style: new TextStyle(
                        fontFamily: 'Harabara',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 60.0),
                  ),
                )
              ],
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 80.0, vertical: 0.0),
              child: new CupertinoTextField(
                controller: usernameController,
                onChanged: usernameController.clear(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(9.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  )
                ),
              ),
            ),
            new SizedBox(
              height: 15.0,
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 80.0, vertical: 0.0),
              child: new CupertinoTextField(
                controller: passwordController,
                obscureText: true,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(9.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  )
                ),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80.0, vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        _loginPost(context, usernameController.text, passwordController.text);

                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              color: Colors.blue,
                              borderRadius: new BorderRadius.circular(9.0)),
                          child: new Text("Login",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}