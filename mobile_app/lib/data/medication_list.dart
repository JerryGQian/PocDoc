// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:veggieseasons/data/medication.dart';

class MedicationList {
  static List<Medication> medications = [
    Medication(
      id: 1,
      name: 'Aspirin',
      medicalName: 'acetylsalicylic acid',
      imageAssetPath: 'assets/images/apple.jpg',
      category: MedicationCategory.postStroke,
      shortDescription: 'Commonly used as a pain reliever for minor aches and pains and fevers.',
      accentColor: Color(0x40de8c66),
      seasons: [Season.winter, Season.spring, Season.summer, Season.autumn],
    ),
    Medication(
      id: 2,
      name: 'Coumadin',
      medicalName: 'warfarin',
      imageAssetPath: 'assets/images/artichoke.jpg',
      category: MedicationCategory.postStroke,
      shortDescription: 'The armadillo of vegetables.',
      accentColor: Color(0x408ea26d),
      seasons: [Season.spring, Season.autumn],
    ),
    Medication(
      id: 3,
      name: 'Accolate',
      medicalName: 'zafirlukast',
      imageAssetPath: 'assets/images/asparagus.jpg',
      category: MedicationCategory.diabetes,
      shortDescription: 'It\'s been used a food and medicine for millenia.',
      accentColor: Color(0x408cb437),
      seasons: [Season.spring],
    ),
    Medication(
      id: 4,
      name: 'Relenza',
      medicalName: 'zanamivir',
      imageAssetPath: 'assets/images/avocado.jpg',
      category: MedicationCategory.bloodPressure,
      shortDescription: 'One of the oiliest, richest vegetables money can buy.',
      accentColor: Color(0x40b0ba59),
      seasons: [Season.winter, Season.spring, Season.summer],
    ),
    Medication(
      id: 5,
      name: 'Zemplar Tablets',
      medicalName: 'paricalcitol',
      imageAssetPath: 'assets/images/blackberry.jpg',
      category: MedicationCategory.antiClotting,
      shortDescription: 'Find them on backroads and fences in the Northwest.',
      accentColor: Color(0x409d5adb),
      seasons: [Season.summer],
    ),
    Medication(
      id: 6,
      name: 'Zerit',
      medicalName: 'stavudine',
      imageAssetPath: 'assets/images/cantaloupe.jpg',
      category: MedicationCategory.atrialFibrilation,
      shortDescription: 'A fruit so tasty there\'s a utensil just for it.',
      accentColor: Color(0x40f6bd56),
      seasons: [Season.summer],
    ),

  ];
}
