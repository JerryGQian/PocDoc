// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:pocketmd/data/medication.dart';

class MedicationList {
  static List<Medication> medications = [
    Medication(
      id: 1,
      name: 'Aspirin',
      medicalName: 'acetylsalicylic acid',
      imageAssetPath: 'assets/images/apple.jpg',
      category: MedicationCategory.postStroke,
      shortDescription: 'Prevents blood clots from forming.',
      accentColor: Color(0x40de8c66),
      categories: [MedicationCategory.antiClotting],
    ),
    Medication(
      id: 2,
      name: 'Coumadin',
      medicalName: 'warfarin',
      imageAssetPath: 'assets/images/artichoke.jpg',
      category: MedicationCategory.postStroke,
      shortDescription: 'Treats and prevents blood clots.',
      accentColor: Color(0x408ea26d),
      categories: [MedicationCategory.antiClotting, MedicationCategory.atrialFibrilation],
    ),
    Medication(
      id: 3,
      name: 'Activase',
      medicalName: 'alteplase',
      imageAssetPath: 'assets/images/asparagus.jpg',
      category: MedicationCategory.diabetes,
      shortDescription: 'Breaks up blood clots.',
      accentColor: Color(0x408cb437),
      categories: [MedicationCategory.antiClotting],
    ),
    Medication(
      id: 4,
      name: 'Retavase',
      medicalName: 'reteplase',
      imageAssetPath: 'assets/images/avocado.jpg',
      category: MedicationCategory.bloodPressure,
      shortDescription: 'One of the oiliest, richest vegetables money can buy.',
      accentColor: Color(0x40b0ba59),
      categories: [MedicationCategory.antiClotting],
    ),
    Medication(
      id: 5,
      name: 'Heparin',
      medicalName: 'unfractionated heparin',
      imageAssetPath: 'assets/images/blackberry.jpg',
      category: MedicationCategory.antiClotting,
      shortDescription: 'Find them on backroads and fences in the Northwest.',
      accentColor: Color(0x409d5adb),
      categories: [MedicationCategory.antiCLotting],
    ),
    Medication(
      id: 6,
      name: 'Zerit',
      medicalName: 'stavudine',
      imageAssetPath: 'assets/images/cantaloupe.jpg',
      category: MedicationCategory.atrialFibrilation,
      shortDescription: 'A fruit so tasty there\'s a utensil just for it.',
      accentColor: Color(0x40f6bd56),
      categories: [MedicationCategory.diabetes],
    ),
    Medication(
      id: 7,
      name: 'Statin',
      medicalName: 'tbd',
      imageAssetPath: 'assets/images/cantaloupe.jpg',
      category: MedicationCategory.atrialFibrilation,
      shortDescription: 'A fruit so tasty there\'s a utensil just for it.',
      accentColor: Color(0x40f6bd56),
      categories: [MedicationCategory.cholesterol],
    ),

  ];
}
