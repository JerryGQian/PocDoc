import 'package:flutter/cupertino.dart';
import "main.dart";


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book),
          title: Text('My Garden'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          title: Text('Search'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings),
          title: Text('Settings'),
        ),
      ]),
      tabBuilder: (context, index) {
        if (index == 0) {
          return Chat();
        } else if (index == 1) {
          return FavoritesScreen();
        } else if (index == 2) {
          return SearchScreen();
        } else {
          return SettingsScreen();
        }
      },
    );
  }
}

/*
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
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: (i==0) ? Text('Articles') : Text('Views'),
            ),
            child: Center(
              child: CupertinoButton(
                child: Text(
                  "This is tab #$i",
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navLargeTitleTextStyle
                      .copyWith(fontSize: 32),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) {
                      return DetailScreen(i == 0 ? 'Articles' : 'Views');
                    }),
                  );
                },
              ),
            ),
          );
        }
    );
  }
}*/