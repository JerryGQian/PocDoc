// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:veggieseasons/data/medication.dart';
import 'package:veggieseasons/screens/details.dart';
import 'package:veggieseasons/styles.dart';

/// A Card-like Widget that responds to tap events by animating changes to its
/// elevation and invoking an optional [onPressed] callback.
class PressableCard extends StatefulWidget {
  const PressableCard({
    @required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
    this.upElevation = 2.0,
    this.downElevation = 0.0,
    this.shadowColor = CupertinoColors.black,
    this.duration = const Duration(milliseconds: 100),
    this.onPressed,
    Key key,
  })  : assert(child != null),
        assert(borderRadius != null),
        assert(upElevation != null),
        assert(downElevation != null),
        assert(shadowColor != null),
        assert(duration != null),
        super(key: key);

  final VoidCallback onPressed;

  final Widget child;

  final BorderRadius borderRadius;

  final double upElevation;

  final double downElevation;

  final Color shadowColor;

  final Duration duration;

  @override
  _PressableCardState createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> {
  bool cardIsDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => cardIsDown = false);
        if (widget.onPressed != null) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => setState(() => cardIsDown = true),
      onTapCancel: () => setState(() => cardIsDown = false),
      child: AnimatedPhysicalModel(
        elevation: cardIsDown ? widget.downElevation : widget.upElevation,
        borderRadius: widget.borderRadius,
        shape: BoxShape.rectangle,
        shadowColor: widget.shadowColor,
        duration: widget.duration,
        color: CupertinoColors.lightBackgroundGray,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: widget.child,
        ),
      ),
    );
  }
}

class PrescriptionCard extends StatelessWidget {
  PrescriptionCard(this.medication, this.isInSeason, this.isPreferredCategory);

  /// Veggie to be displayed by the card.
  final Medication medication;

  /// If the veggie is in season, it's displayed more prominently and the
  /// image is fully saturated. Otherwise, it's reduced and de-saturated.
  final bool isInSeason;

  /// Whether [medication] falls into one of user's preferred [MedicationCategory]s
  final bool isPreferredCategory;

  Widget _buildDetails() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: medication.accentColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              medication.name,
              style: Styles.cardTitleText,
            ),
            Text(
              medication.shortDescription,
              style: Styles.cardDescriptionText,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      onPressed: () {
        Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => DetailsScreen(medication.id),
          fullscreenDialog: true,
        ));
      },
      child: Stack(
        children: [
          Semantics(
            label: 'A card background featuring ${medication.name}',
            child: Container(
              height: isInSeason ? 350 : 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: isInSeason
                      ? null
                      : Styles.desaturatedColorFilter,
                  image: AssetImage(
                    medication.imageAssetPath,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: _buildDetails(),
          ),
        ],
      ),
    );
  }
}
