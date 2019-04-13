// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:pocketmd/data/prescription.dart';

class PrescriptionList {
  static List<Prescription> prescriptions = [
    Prescription(
      id: 1,
      name: 'Aspirin',
      prescriptionDescription: 'Take 2 pills every 12 hours for 2 weeks',
      quantity: 64,
      refills: 3,
      physicianName: 'Dr. Who',
      date: new DateTime.utc(2019, 2, 3),
    ),
    Prescription(
      id: 2,
      name: 'Accolate',
      prescriptionDescription: 'Take 1 pill every day for 1 month',
      quantity: 28,
      refills: 1,
      physicianName: 'Dr. Whoo',
      date: new DateTime.utc(2018, 2, 3),
    ),
    Prescription(
      id: 3,
      name: 'Zerit',
      prescriptionDescription: 'Take 5 pill every day for 1 week',
      quantity: 28,
      refills: 1,
      physicianName: 'Dr. Whoo??',
      date: new DateTime.utc(2019, 1, 20),
    ),

  ];
}
