// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:veggieseasons/data/medication.dart';

class PrescriptionList {
  static List<Medication> medications = [
    Medication(
      id: 1,
      name: 'Aspirin',
      medicalName: 'acetylsalicylic acid',
      imageAssetPath: 'assets/images/apple.jpg',
      category: MedicationCategory.fruit,
      shortDescription: 'Commonly used as a pain reliever for minor aches and pains and fevers.',
      accentColor: Color(0x40de8c66),
      seasons: [Season.winter, Season.spring, Season.summer, Season.autumn],
      vitaminAPercentage: 2,
      vitaminCPercentage: 8,
      servingSize: 'One large apple',
      caloriesPerServing: 130,
      trivia: [
        Trivia(
          'A peck of apples (that\'s a real unit of mesaurement!) weighs approximately how many pounds?',
          [
            '10 pounds',
            '20 pounds',
            '30 pounds',
          ],
          0,
        ),
        Trivia(
          'Which of these is an actual variety of apples?',
          [
            'Dancing Turkey',
            'Winter Banana',
            'Red Sloth',
          ],
          1,
        ),
        Trivia(
          'In Greek mythology, Paris gives a golden apple marked "To the Fairest" to a goddess. Which one?',
          [
            'Hera',
            'Athena',
            'Aphrodite',
          ],
          2,
        ),
        Trivia(
          'Apples in the supermarket can be up to how old?',
          [
            '1 week',
            '1 month',
            '1 year',
          ],
          2,
        ),
        Trivia(
          'How long does it take a typical apple tree to produce its first fruit?',
          [
            'One to two years',
            'Four or five years',
            'Eight to ten years',
          ],
          1,
        ),
        Trivia(
          'Archaeological evidence of humans eating apples dates back how far?',
          [
            '500 C.E.',
            '2000 B.C.E.',
            '6500 B.C.E.',
          ],
          2,
        ),
        Trivia(
          'What are the seed pockets inside an apple called?',
          [
            'Tarsals',
            'Carpels',
            'Sacs',
          ],
          1,
        ),
      ],
    ),
    Medication(
      id: 2,
      name: 'Coumadin',
      medicalName: 'warfarin',
      imageAssetPath: 'assets/images/artichoke.jpg',
      category: MedicationCategory.flower,
      shortDescription: 'The armadillo of vegetables.',
      accentColor: Color(0x408ea26d),
      seasons: [Season.spring, Season.autumn],
      vitaminAPercentage: 0,
      vitaminCPercentage: 25,
      servingSize: '1 medium artichoke',
      caloriesPerServing: 60,
      trivia: [
        Trivia(
          'Artichokes are which part of the plant?',
          [
            'Flower bud',
            'Root',
            'Seed',
          ],
          0,
        ),
        Trivia(
          '"Jerusalem artichoke" is another term for which vegetable?',
          [
            'Potato',
            'Cabbage',
            'Sunchoke',
          ],
          2,
        ),
        Trivia(
          'Which city claims to be The Artichoke Capital of the World?',
          [
            'Castroville, California',
            'Galveston, Texas',
            'London, England',
          ],
          0,
        ),
        Trivia(
          'Artichokes are technically which type of plant?',
          [
            'Thistle',
            'Azalea',
            'Tulip',
          ],
          0,
        ),
      ],
    ),
    Medication(
      id: 3,
      name: 'Accolate',
      medicalName: 'zafirlukast',
      imageAssetPath: 'assets/images/asparagus.jpg',
      category: MedicationCategory.fern,
      shortDescription: 'It\'s been used a food and medicine for millenia.',
      accentColor: Color(0x408cb437),
      seasons: [Season.spring],
      vitaminAPercentage: 10,
      vitaminCPercentage: 15,
      servingSize: '5 spears',
      caloriesPerServing: 20,
      trivia: [
        Trivia(
          'The nodules at the tip of an asparagus spear are actually which part of the plant?',
          [
            'Seeds',
            'Leaves',
            'Potective scales',
          ],
          1,
        ),
        Trivia(
          'How is white asparagus made?',
          [
            'It\'s watered with milk',
            'It\'s a different species',
            'It\'s grown in the shade',
          ],
          2,
        ),
        Trivia(
          'Asapragus spears have been observed growing how many inches in a single day?',
          [
            '1',
            '3',
            '6',
          ],
          2,
        ),
        Trivia(
          'To which flower is asparagus related?',
          [
            'Lily',
            'Rose',
            'Whole wheat',
          ],
          0,
        ),
      ],
    ),
    Medication(
      id: 4,
      name: 'Relenza',
      medicalName: 'zanamivir',
      imageAssetPath: 'assets/images/avocado.jpg',
      category: MedicationCategory.stealthFruit,
      shortDescription: 'One of the oiliest, richest vegetables money can buy.',
      accentColor: Color(0x40b0ba59),
      seasons: [Season.winter, Season.spring, Season.summer],
      vitaminAPercentage: 0,
      vitaminCPercentage: 4,
      servingSize: '1/5 medium avocado',
      caloriesPerServing: 50,
      trivia: [
        Trivia(
          'What\'s the most popular variety of avocado?',
          [
            'Stevenson',
            'Hass',
            'Juicy Lucy',
          ],
          1,
        ),
        Trivia(
          'The word avocado derives from "ahuacatl," found in which civilization?',
          [
            'Aztec',
            'Incan',
            'Sumerian',
          ],
          0,
        ),
        Trivia(
          'What percentage of an avocado is nutritional fat?',
          [
            '10',
            '25',
            '50',
          ],
          1,
        ),
      ],
    ),
    Medication(
      id: 5,
      name: 'Zemplar Tablets',
      medicalName: 'paricalcitol',
      imageAssetPath: 'assets/images/blackberry.jpg',
      category: MedicationCategory.berry,
      shortDescription: 'Find them on backroads and fences in the Northwest.',
      accentColor: Color(0x409d5adb),
      seasons: [Season.summer],
      vitaminAPercentage: 6,
      vitaminCPercentage: 4,
      servingSize: '1 cup',
      caloriesPerServing: 62,
      trivia: [
        Trivia(
          'What color are unripe blackberries?',
          [
            'Red',
            'White',
            'Brown',
          ],
          0,
        ),
        Trivia(
          'The blackberry is the official fruit of which American state?',
          [
            'Washington',
            'Colorado',
            'Alabama',
          ],
          2,
        ),
        Trivia(
          'How many varieties of blackberries are known to exist?',
          [
            '500',
            '1000',
            '2000',
          ],
          2,
        ),
      ],
    ),
    Medication(
      id: 6,
      name: 'Zerit',
      medicalName: 'stavudine',
      imageAssetPath: 'assets/images/cantaloupe.jpg',
      category: MedicationCategory.melon,
      shortDescription: 'A fruit so tasty there\'s a utensil just for it.',
      accentColor: Color(0x40f6bd56),
      seasons: [Season.summer],
      vitaminAPercentage: 120,
      vitaminCPercentage: 80,
      servingSize: '1/4 medium cantaloupe',
      caloriesPerServing: 50,
      trivia: [
        Trivia(
          'Which of these is another name for cantaloupe?',
          [
            'Muskmelon',
            'Crenshaw melon',
            'Rindfruit',
          ],
          0,
        ),
        Trivia(
          'The word "cantaloupe" is a reference to what?',
          [
            'The Latin word for a ring of seeds',
            'The gardens of a castle in Italy',
            'An aphid species that feeds on cantaloupe leaves',
          ],
          1,
        ),
        Trivia(
          'Cantaloupes grow on what kind of plant?',
          [
            'Tree',
            'Shrub',
            'Vine',
          ],
          2,
        ),
        Trivia(
          'The most expensive melons in Japan can sell for up to how much?',
          [
            '\$100',
            '\$1,000',
            '\$10,000',
          ],
          2,
        ),
      ],
    ),

  ];
}
