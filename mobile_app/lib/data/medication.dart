// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

enum MedicationCategory {
  bloodPressure,
  antiClotting,
  atrialFibrilation,
  cholesterol,
  diabetes,
  postStroke,
}

enum MedicationType {
  bloodPressure,
  antiClotting,
  atrialFibrilation,
  cholesterol,
  diabetes,
  postStroke,
}

const Map<MedicationCategory, String> medicationCategoryNames = {
  MedicationCategory.bloodPressure: 'Blood pressure',
  MedicationCategory.antiClotting: 'Anti-clotting',
  MedicationCategory.atrialFibrilation: 'Atrial fibrilation',
  MedicationCategory.cholesterol: 'Cholesterol',
  MedicationCategory.diabetes: 'Diabetes',
  MedicationCategory.postStroke: 'Post stroke',
};



class Medication {
  Medication({
    @required this.id,
    @required this.name,
    this.medicalName,
    @required this.imageAssetPath,
    @required this.category,
    @required this.shortDescription,
    @required this.accentColor,
    @required this.categories,
    this.isFavorite = false,
  });

  final int id;

  final String name;
  final String medicalName;

  /// Each veggie has an associated image asset that's used as a background
  /// image and icon.
  final String imageAssetPath;

  final MedicationCategory category;

  /// A short, snappy line.
  final String shortDescription;

  /// A color value to use when constructing UI elements to match the image
  /// found at [imageAssetPath].
  final Color accentColor;

  /// Seasons during which a veggie is harvested.
  final List<MedicationCategory> categories;

  /// Whether or not the veggie has been saved to the user's garden (i.e. marked
  /// as a favorite).
  bool isFavorite;

  String get categoryName => medicationCategoryNames[category];
}
