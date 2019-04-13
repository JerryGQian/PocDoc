// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class Prescription {
  Prescription({
    @required this.id,
    @required this.name,
    @required this.prescriptionDescription,
    @required this.quantity,
    @required this.refills,
    @required this.date,
    this.isFavorite = false,
  });

  final int id;

  final String name;

  final String prescriptionDescription;

  /// Each veggie has an associated image asset that's used as a background
  /// image and icon.
  final int quantity;
  final int refills;
  final int date;

  /// Whether or not the veggie has been saved to the user's garden (i.e. marked
  /// as a favorite).
  bool isFavorite;
}
