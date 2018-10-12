import 'package:flutter/foundation.dart';

class Medicine {
  final String name;
  final String ean;
  final MedicineForm form;
  final List<String> activeSubstances;
  final int packageQuantity;
  final Dosage dosage;
  final List<Dose> doseHistory;

  const Medicine(
      {this.name,
      this.ean,
      this.form,
      this.activeSubstances,
      this.packageQuantity,
      this.dosage,
      this.doseHistory});

  bool isWarning() => true;
}

enum MedicineForm {
  capsules, // elastyczne kapsułki
  film_coated_tablets, // tabletki powlekane
  herbs, // zioła do zaparzania
  prolonged_release_tablets, // tabletki o przedłużonym uwalnianiu
  dialisys_solution, // roztwór do dializy otrzewnowej
  syrup, // syrop
  // more to come...
}

class Dosage {
  final DosageFrequency frequency;
  final int amountToTake;

  const Dosage({this.frequency, this.amountToTake = 1});
}

enum DosageFrequency {
  every_three_days,
  every_two_days,
  daily,
  two_times_a_day,
  three_times_a_day,
  four_times_a_day
}

class Dose {
  final DateTime takenAt;
  final String notes;

  const Dose({@required this.takenAt, this.notes});
}
