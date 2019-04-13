// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

enum TaskCategory {
  bloodPressure,
  antiClotting,
  atrialFibrilation,
  cholesterol,
  diabetes,
  postStroke,
}

const Map<TaskCategory, String> medicationCategoryNames = {
  TaskCategory.bloodPressure: 'Blood pressure',
  TaskCategory.antiClotting: 'Anti-clotting',
  TaskCategory.atrialFibrilation: 'Atrial fibrilation',
  TaskCategory.cholesterol: 'Cholesterol',
  TaskCategory.diabetes: 'Diabetes',
  TaskCategory.postStroke: 'Post stroke',
};



class Task {
  Task({
    @required this.id,
    @required this.name,
    @required this.imageAssetPath,
    @required this.shortDescription,
    @required this.accentColor,
    @required this.categories,
    this.isFavorite = false,
  });

  final int id;

  final String name;

  /// Each veggie has an associated image asset that's used as a background
  /// image and icon.
  final String imageAssetPath;

  /// A short, snappy line.
  final String shortDescription;

  /// A color value to use when constructing UI elements to match the image
  /// found at [imageAssetPath].
  final Color accentColor;

  /// Seasons during which a veggie is harvested.
  final List<TaskCategory> categories;

  /// Whether or not the veggie has been saved to the user's garden (i.e. marked
  /// as a favorite).
  bool isFavorite;
}
