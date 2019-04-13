// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:pocketmd/data/medication.dart';
import 'package:pocketmd/data/task.dart';
import 'package:pocketmd/screens/details.dart';
import 'package:pocketmd/styles.dart';

class TaskHeadline extends StatelessWidget {
  final Task task;
  const TaskHeadline(this.task);

  List<Widget> _buildSeasonDots(List<TaskCategory> taskCategories) {
    List<Widget> widgets = <Widget>[];

    for (TaskCategory taskCategory in taskCategories) {
      widgets.add(SizedBox(width: 4.0));
      widgets.add(
        Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            color: Styles.seasonColors[taskCategory],
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => DetailsScreen(task.id),
        fullscreenDialog: true,
      )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.0,
            height: 80.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                task.imageAssetPath,
                semanticLabel: 'An icon showing ${task.name}',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    Text(task.name, style: Styles.headlineName),
                  ]..addAll(_buildSeasonDots(task.categories)),
                ),
                Text(task.shortDescription,
                    style: Styles.headlineDescription),
              ],
            ),
          )
        ],
      ),
    );
  }
}
