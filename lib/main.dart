import 'package:flutter/cupertino.dart';
import 'login.dart';
import 'chat.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your applicati6on.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          navLargeTitleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 70.0,
            color: CupertinoColors.activeBlue,
          )
        )
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid),
            title: Text('Articles'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye_solid),
            title: Text('Views'),
          ),
        ]
      ),
      tabBuilder: (context, i) {
        return Center(
          child: Text('Hello, $i!'),
        );
      }
    );
  }

  /*
  return CupertinoPageScaffold(
      child: Center(
        child: Text('Hello world',
        style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle),
      )
    );
   */
}
