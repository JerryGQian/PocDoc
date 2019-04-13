// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:pocketmd/data/app_state.dart';
import 'package:pocketmd/data/preferences.dart';
import 'package:pocketmd/data/medication.dart';
import 'package:pocketmd/data/prescription.dart';
import 'package:pocketmd/styles.dart';
import 'package:pocketmd/widgets/close_button.dart';

class PrescriptionChart extends StatelessWidget {
  const PrescriptionChart(this.prescription, this.medication, this.prefs);

  final Prescription prescription;

  final Medication medication;

  final Preferences prefs;

  // Creates a [Text] widget to display a veggie's "percentage of your daily
  // value of this vitamin" data adjusted for the user's preferred calorie
  // target.

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 9.0,
              bottom: 4.0,
            ),
            child: Text(
              'Prescription info',
              style: Styles.detailsServingHeaderText,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Styles.servingInfoBorderColor),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Table(
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Quantity:',
                          style: Styles.detailsServingLabelText,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          prescription.quantity.toString(),
                          textAlign: TextAlign.end,
                          style: Styles.detailsServingValueText,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Refills:',
                          style: Styles.detailsServingLabelText,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          prescription.refills.toString(),
                          textAlign: TextAlign.end,
                          style: Styles.detailsServingValueText,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Orig. Rx:',
                          style: Styles.detailsServingLabelText,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          prescription.date.month.toString() + "/" + prescription.date.day.toString() + "/" + prescription.date.year.toString(),
                          textAlign: TextAlign.end,
                          style: Styles.detailsServingValueText,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Physician:',
                          style: Styles.detailsServingLabelText,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          prescription.physicianName,
                          textAlign: TextAlign.end,
                          style: Styles.detailsServingValueText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: FutureBuilder(
                  future: prefs.desiredCalories,
                  builder: (context, snapshot) {
                    return Text(
                      prescription.prescriptionDescription,
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class InfoView extends StatelessWidget {
  final int id;

  const InfoView(this.id);

  Widget build(BuildContext context) {
    final appState = ScopedModel.of<AppState>(context, rebuildOnChange: true);
    final prefs = ScopedModel.of<Preferences>(context, rebuildOnChange: true);
    final prescription = appState.getPrescription(id);
    final medication = appState.getMedication(prescription);

    final seasonIcons = <Widget>[];

    for (MedicationCategory season in medication.categories) {
      seasonIcons.addAll([
        SizedBox(width: 12.0),
        Padding(
          padding: Styles.seasonIconPadding[season],
          child: Icon(
            Styles.seasonIconData[season],
            semanticLabel: medicationCategoryNames[season],
            color: Styles.seasonColors[season],
          ),
        ),
      ]);
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FutureBuilder(
                future: prefs.preferredCategories,
                builder: (context, snapshot) {
                  return Text(
                    medication.categoryName.toUpperCase(),
                    style: (snapshot.hasData &&
                            snapshot.data.contains(medication.category))
                        ? Styles.detailsPreferredCategoryText
                        : Styles.detailsCategoryText,
                  );
                },
              ),
              Spacer(),
            ]..addAll(seasonIcons),
          ),
          SizedBox(height: 8.0),

          Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  medication.name,
                  style: Styles.detailsTitleText,
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Align(
                      alignment: Alignment.bottomLeft,
                    child: Text(
                      medication.medicalName,
                      style: Styles.detailsDescriptionText,
                    )
                  ),
                ),

              ]
          ),


          SizedBox(height: 8.0),
          Text(
            medication.shortDescription,
            style: Styles.detailsDescriptionText,
          ),
          PrescriptionChart(prescription, medication, prefs),
          SizedBox(height: 24.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoSwitch(
                value: medication.isFavorite,
                onChanged: (value) {
                  appState.setFavorite(id, value);
                },
              ),
              SizedBox(width: 8.0),
              Text('Save to Favorites'),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  final int id;


  DetailsScreen(this.id);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _selectedViewIndex = 0;

  Widget _buildHeader(BuildContext context, AppState model) {
    print("Widget id: ");
    print(widget.id);
    final veggie = model.getMedication(model.getPrescription(widget.id));

    return SizedBox(
      height: 150.0,
      child: Stack(
        children: [
          Positioned(
            right: 0.0,
            left: 0.0,
            child: Image.asset(
              veggie.imageAssetPath,
              fit: BoxFit.cover,
              semanticLabel: 'A background image of ${veggie.name}',
            ),
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            child: SafeArea(
              child: CloseButton(() {
                Navigator.of(context).pop();
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = ScopedModel.of<AppState>(context, rebuildOnChange: true);

    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context, appState),
          Expanded(
            child: ListView(
              children: [
                CupertinoSegmentedControl(
                  children: {
                    0: Text('Prescription & Info'),
                    1: Text('Trivia'),
                  },
                  groupValue: _selectedViewIndex,
                  onValueChanged: (value) {
                    setState(() => _selectedViewIndex = value);
                  },
                ),
                _selectedViewIndex == 0
                    ? InfoView(widget.id)
                    : InfoView(widget.id),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
