// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:scoped_model/scoped_model.dart';
import 'package:pocketmd/data/medication.dart';
import 'package:pocketmd/data/medication_list.dart';
import 'package:pocketmd/data/prescription.dart';
import 'package:pocketmd/data/presciption_list.dart';
import 'package:pocketmd/data/task.dart';
import 'package:pocketmd/data/task_list.dart';

class AppState extends Model {
  List<Prescription> _prescriptions;
  List<Medication> _medications;
  List<Task> _tasks;

  AppState() : _prescriptions = PrescriptionList.prescriptions, _medications = MedicationList.medications, _tasks = TaskList.tasks;

  Medication getMedication(Prescription p) {
    return _medications.singleWhere((m) => m.name == p.name);
  }

  List<Prescription> get allVeggies => List<Prescription>.from(_prescriptions);

  Prescription getPrescription(int id) => _prescriptions.singleWhere((v) => v.id == id);
  Prescription getTask(int id) => _prescriptions.singleWhere((v) => v.id == id);

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

  List<Task> searchTasks(String terms) => _tasks
      .where((v) => v.name.toLowerCase().contains(terms.toLowerCase()))
      .toList();

  void setFavorite(int id, bool isFavorite) {
    Prescription veggie = getPrescription(id);
    veggie.isFavorite = isFavorite;
    notifyListeners();
  }

  static MedicationCategory _getSeasonForDate(DateTime date) {
    // Technically the start and end dates of seasons can vary by a day or so,
    // but this is close enough for produce.
    switch (date.month) {
      case 1:
        return MedicationCategory.postStroke;
      case 2:
        return MedicationCategory.postStroke;
      case 3:
        return date.day < 21 ? MedicationCategory.postStroke : MedicationCategory.postStroke;
      case 4:
        return MedicationCategory.postStroke;
      case 5:
        return MedicationCategory.postStroke;
      case 6:
        return date.day < 21 ? MedicationCategory.postStroke : MedicationCategory.postStroke;
      case 7:
        return MedicationCategory.postStroke;
      case 8:
        return MedicationCategory.postStroke;
      case 9:
        return date.day < 22 ? MedicationCategory.postStroke : MedicationCategory.postStroke;
      case 10:
        return MedicationCategory.postStroke;
      case 11:
        return MedicationCategory.postStroke;
      case 12:
        return date.day < 22 ? MedicationCategory.postStroke : MedicationCategory.postStroke;
      default:
        throw ArgumentError('Can\'t return a season for month #${date.month}.');
    }
  }
}
