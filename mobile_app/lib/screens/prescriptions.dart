// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:veggieseasons/data/app_state.dart';
import 'package:veggieseasons/data/prescription.dart';
import 'package:veggieseasons/styles.dart';
import 'package:veggieseasons/widgets/search_bar.dart';
import 'package:veggieseasons/widgets/prescription_headline.dart';

class PrescriptionsScreen extends StatefulWidget {
  @override
  _PrescriptionsScreenState createState() => _PrescriptionsScreenState();
}

class _PrescriptionsScreenState extends State<PrescriptionsScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  String terms = '';

  @override
  void initState() {
    super.initState();
    controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() => terms = controller.text);
  }

  Widget _createSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(
        controller: controller,
        focusNode: focusNode,
      ),
    );
  }

  Widget _buildSearchResults(List<Prescription> prescriptions) {
    if (prescriptions.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'No prescriptions matching your search.',
            style: Styles.headlineDescription,
          ),
        ),
      );
    }

    final model = ScopedModel.of<AppState>(context, rebuildOnChange: true);

    return ListView.builder(
      itemCount: prescriptions.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
          child: PrescriptionHeadline(prescriptions[i], model.getMedication(prescriptions[i])),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<AppState>(context, rebuildOnChange: true);

    return CupertinoTabView(
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Styles.scaffoldBackground,
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                _createSearchBox(),
                Expanded(
                  child: _buildSearchResults(model.searchPrescriptions(terms)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
