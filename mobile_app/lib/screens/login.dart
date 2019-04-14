import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pocketmd/data/preferences.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'home.dart';


Future<void> _loginPost(BuildContext context, Preferences model, String username, String password) async {
  /*var url = 'http://35.196.65.157/login';
  var response = await http.post(url, body: {'username': username, 'password': password});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  var sessionID = int.tryParse(response.body);
  print(sessionID);
  */
  print(username);
  model.setName(username);

  Navigator.push(context, MaterialPageRoute(
      builder: (context) => HomeScreen()
  ));

}

class LoginScreen extends StatelessWidget {
  TextEditingController usernameController = new TextEditingController(text: 'Username');
  TextEditingController passwordController = new TextEditingController(text: 'Password');

  @override
  Widget build(BuildContext context) {
    print("Hello there!");
    final model = ScopedModel.of<Preferences>(context, rebuildOnChange: true);


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
                  padding: const EdgeInsets.only(top: 100.0, bottom: 50.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                     'assets/images/pocdoc_logo_med.png',
                      width: .7*MediaQuery.of(context).size.width,
                      height: .2*MediaQuery.of(context).size.height,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 80.0, vertical: 0.0),
              child: new CupertinoTextField(
                controller: usernameController,
                //onChanged: usernameController.clear(),
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
                        _loginPost(context, model, usernameController.text, passwordController.text);

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