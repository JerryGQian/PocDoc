// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:pocketmd/data/task.dart';

class TaskList {
  static List<Task> tasks = [
    Task(
      id: 1,
      name: 'Reaction Speed Test',
      imageAssetPath: 'assets/images/apple.jpg',
      shortDescription: 'Train your reaction time with this game!',
      accentColor: Color(0x40de8c66),
      categories: [TaskCategory.antiClotting, TaskCategory.cholesterol],
    ),
    Task(
      id: 2,
      name: 'Task 2',
      imageAssetPath: 'assets/images/apple.jpg',
      shortDescription: 'Commonly used as a pain reliever for minor aches and pains and fevers.',
      accentColor: Color(0x40de8c66),
      categories: [TaskCategory.antiClotting, TaskCategory.cholesterol],
    ),
    Task(
      id: 3,
      name: 'Task 3',
      imageAssetPath: 'assets/images/apple.jpg',
      shortDescription: 'Commonly used as a pain reliever for minor aches and pains and fevers.',
      accentColor: Color(0x40de8c66),
      categories: [TaskCategory.antiClotting, TaskCategory.cholesterol],
    ),
  ];
}
