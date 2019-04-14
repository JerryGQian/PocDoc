// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:pocketmd/data/app_state.dart';
import 'package:pocketmd/data/preferences.dart';
import 'package:pocketmd/data/medication.dart';
import 'package:pocketmd/styles.dart';
import 'package:pocketmd/widgets/close_button.dart';
//import 'package:flutter/stopwatch'

class ReactionGame extends StatelessWidget {
  bool started = false;
  Stopwatch stopwatch = Stopwatch()..start();

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
              'Reaction speed game',
              style: Styles.detailsServingHeaderText,
            ),
          ),
        ),
        Container(
          /*child: CupertinoButton(
            child: Text("Start/Stop"),
            onPressed: print("Yo"),//started ? stopwatch.clear() : stopwatch.stop()



          ),*/

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
          ReactionGame(),
          SizedBox(height: 24.0),
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
    final Medication medication = model.getMedication(model.getPrescription(widget.id));

    return SizedBox(
      height: 150.0,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: medication.accentColor,
              ),
            )
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
                    1: Text(''),
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
