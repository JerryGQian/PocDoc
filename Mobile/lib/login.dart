import 'package:flutter/cupertino.dart';
import "main.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen(this.topic);

  final String topic;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Center(
        child: Text(
          'Login for $topic',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}