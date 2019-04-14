// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmd/data/medication.dart';
import 'package:pocketmd/data/prescription.dart';
import 'package:pocketmd/screens/details.dart';
import 'package:pocketmd/styles.dart';

class PrescriptionHeadline extends StatelessWidget {
  final Prescription prescription;
  final Medication medication;

  const PrescriptionHeadline(this.prescription, this.medication);

  List<Widget> _buildSeasonDots(List<MedicationCategory> medicationCategories) {
    List<Widget> widgets = <Widget>[];

    for (MedicationCategory medicationCategory in medicationCategories) {
      widgets.add(SizedBox(width: 4.0));
      widgets.add(
        Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            color: Styles.seasonColors[medicationCategory],
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
            builder: (context) => DetailsScreen(prescription.id),
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
              child: Container(
                decoration: BoxDecoration(
                  color: medication.accentColor,
                  image: DecorationImage(
                    image: ExactAssetImage('images/flowers.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: medication.accentColor,
                    width: 8.0,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(medication.name[0],
                    style: TextStyle(
                      fontFamily: 'Harabara',
                      color: medication.accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0),
                  )
              ),
              )
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
                    Text(medication.name, style: Styles.headlineName),
                  ]..addAll(_buildSeasonDots(medication.categories)),
                ),
                Text(medication.shortDescription,
                    style: Styles.headlineDescription),
              ],
            ),
          )
        ],
      ),
    );
  }
}
