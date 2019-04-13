// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:scoped_model/scoped_model.dart';
import 'package:veggieseasons/data/medication.dart';
import 'package:veggieseasons/data/medication_list.dart';
import 'package:veggieseasons/data/prescription.dart';
import 'package:veggieseasons/data/presciption_list.dart';

class AppState extends Model {
  List<Prescription> _prescriptions;
  List<Medication> _medications;

  AppState() : _prescriptions = PrescriptionList.prescriptions, _medications = MedicationList.medications;

  Medication getMedication(Prescription p) {
    return _medications.singleWhere((m) => m.name == p.name);
  }

  List<Prescription> get allVeggies => List<Prescription>.from(_prescriptions);

  Prescription getPrescription(int id) => _prescriptions.singleWhere((v) => v.id == id);

  List<Prescription> get availableVeggies {
    return _prescriptions.toList();
  }

  List<Prescription> get unavailableVeggies {
    return _prescriptions.toList();
  }

  List<Prescription> get favoriteVeggies =>
      _prescriptions.where((v) => v.isFavorite).toList();

  List<Prescription> searchPrescriptions(String terms) => _prescriptions
      .where((v) => v.name.toLowerCase().contains(terms.toLowerCase()))
      .toList();

  void setFavorite(int id, bool isFavorite) {
    Prescription veggie = getPrescription(id);
    veggie.isFavorite = isFavorite;
    notifyListeners();
  }

  static Season _getSeasonForDate(DateTime date) {
    // Technically the start and end dates of seasons can vary by a day or so,
    // but this is close enough for produce.
    switch (date.month) {
      case 1:
        return Season.winter;
      case 2:
        return Season.winter;
      case 3:
        return date.day < 21 ? Season.winter : Season.spring;
      case 4:
        return Season.spring;
      case 5:
        return Season.spring;
      case 6:
        return date.day < 21 ? Season.spring : Season.summer;
      case 7:
        return Season.summer;
      case 8:
        return Season.summer;
      case 9:
        return date.day < 22 ? Season.autumn : Season.winter;
      case 10:
        return Season.autumn;
      case 11:
        return Season.autumn;
      case 12:
        return date.day < 22 ? Season.autumn : Season.winter;
      default:
        throw ArgumentError('Can\'t return a season for month #${date.month}.');
    }
  }
}
