// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

enum MedicationCategory {
  allium,
  berry,
  citrus,
  cruciferous,
  fern,
  flower,
  fruit,
  fungus,
  gourd,
  leafy,
  legume,
  melon,
  root,
  stealthFruit,
  stoneFruit,
  tropical,
  tuber,
  vegetable,
}

enum Season {
  winter,
  spring,
  summer,
  autumn,
}

class Trivia {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;

  const Trivia(this.question, this.answers, this.correctAnswerIndex);
}

const Map<MedicationCategory, String> medicationCategoryNames = {
  MedicationCategory.allium: 'Allium',
  MedicationCategory.berry: 'Berry',
  MedicationCategory.citrus: 'Citrus',
  MedicationCategory.cruciferous: 'Cruciferous',
  MedicationCategory.fern: 'Technically a fern',
  MedicationCategory.flower: 'Flower',
  MedicationCategory.fruit: 'Fruit',
  MedicationCategory.fungus: 'Fungus',
  MedicationCategory.gourd: 'Gourd',
  MedicationCategory.leafy: 'Leafy',
  MedicationCategory.legume: 'Legume',
  MedicationCategory.melon: 'Melon',
  MedicationCategory.root: 'Root vegetable',
  MedicationCategory.stealthFruit: 'Stealth fruit',
  MedicationCategory.stoneFruit: 'Stone fruit',
  MedicationCategory.tropical: 'Tropical',
  MedicationCategory.tuber: 'Tuber',
  MedicationCategory.vegetable: 'Vegetable',
};

const Map<Season, String> seasonNames = {
  Season.winter: 'Winter',
  Season.spring: 'Spring',
  Season.summer: 'Summer',
  Season.autumn: 'Autumn',
};

class Medication {
  Medication({
    @required this.id,
    @required this.name,
    @required this.imageAssetPath,
    @required this.category,
    @required this.shortDescription,
    @required this.accentColor,
    @required this.seasons,
    @required this.vitaminAPercentage,
    @required this.vitaminCPercentage,
    @required this.servingSize,
    @required this.caloriesPerServing,
    @required this.trivia,
    this.isFavorite = false,
  });

  final int id;

  final String name;

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
  final List<Season> seasons;

  /// Percentage of the FDA's recommended daily value of vitamin A for someone
  /// with a 2,000 calorie diet.
  final int vitaminAPercentage;

  /// Percentage of the FDA's recommended daily value of vitamin C for someone
  /// with a 2,000 calorie diet.
  final int vitaminCPercentage;

  /// A text description of a single serving (e.g. '1 apple' or '1/2 cup').
  final String servingSize;

  /// Calories per serving (as described in [servingSize]).
  final int caloriesPerServing;

  /// Whether or not the veggie has been saved to the user's garden (i.e. marked
  /// as a favorite).
  bool isFavorite;

  /// A set of trivia questions and answers related to the veggie.
  final List<Trivia> trivia;

  String get categoryName => medicationCategoryNames[category];
}
