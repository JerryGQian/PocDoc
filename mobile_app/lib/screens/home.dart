// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:veggieseasons/screens/favorites.dart';
import 'package:veggieseasons/screens/list.dart';
import 'package:veggieseasons/screens/search.dart';
import 'package:veggieseasons/screens/prescriptions.dart';
import 'package:veggieseasons/screens/chat.dart';
import 'package:veggieseasons/screens/settings.dart';

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
          icon: Icon(CupertinoIcons.pencil),
          title: Text('Prescriptions'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.conversation_bubble),
          title: Text('Chat'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings),
          title: Text('Settings'),
        ),
      ]),
      tabBuilder: (context, index) {
        if (index == 0) {
          return ListScreen();
        } else if (index == 1) {
          return FavoritesScreen();
        } else if (index == 2) {
          return PrescriptionsScreen();
        } else if (index == 3) {
          return ChatScreen();
        } else {
          return SettingsScreen();
        }
      },
    );
  }
}
