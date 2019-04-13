// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:pocketmd/screens/favorites.dart';
import 'package:pocketmd/screens/prescriptions.dart';
import 'package:pocketmd/screens/chat.dart';
import 'package:pocketmd/screens/settings.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book),
          title: Text('Prescriptions'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.pencil),
          title: Text('Favorites'),
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
          return PrescriptionsScreen();
        } else if (index == 1) {
          return FavoritesScreen();
        } else if (index == 2) {
          return ChatScreen();
        } else {
          return SettingsScreen();
        }
      },
    );
  }
}
