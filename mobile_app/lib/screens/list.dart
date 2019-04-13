// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:veggieseasons/data/app_state.dart';
import 'package:veggieseasons/data/preferences.dart';
import 'package:veggieseasons/data/medication.dart';
import 'package:veggieseasons/styles.dart';
import 'package:veggieseasons/widgets/prescription_card.dart';

class ListScreen extends StatelessWidget {
  List<Widget> _generateVeggieRows(
    List<Medication> veggies,
    Preferences prefs,
    { bool inSeason = true }
  ) {
    final cards = List<Widget>();

    for (Medication veggie in veggies) {
      cards.add(Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
        child: FutureBuilder<Set<MedicationCategory>>(
            future: prefs.preferredCategories,
            builder: (context, snapshot) {
              final data = snapshot.data ?? Set<MedicationCategory>();
              return PrescriptionCard(veggie, inSeason, data.contains(veggie.category));
            }),
      ));
    }

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        String dateString = DateFormat("MMMM y").format(DateTime.now());
        final appState =
            ScopedModel.of<AppState>(context, rebuildOnChange: true);
        final prefs =
            ScopedModel.of<Preferences>(context, rebuildOnChange: true);

        final rows = <Widget>[];

        rows.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dateString.toUpperCase(), style: Styles.minorText),
                Text('In season today', style: Styles.headlineText),
              ],
            ),
          ),
        );

        rows.addAll(_generateVeggieRows(appState.availableVeggies, prefs));

        rows.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
            child: Text('Not in season', style: Styles.headlineText),
          ),
        );

        rows.addAll(_generateVeggieRows(appState.unavailableVeggies, prefs, inSeason: false));

        return DecoratedBox(
          decoration: BoxDecoration(color: Color(0xffffffff)),
          child: ListView(
            children: rows,
          ),
        );
      },
    );
  }
}
