import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:lek_bierz/models/medicinal_product.dart' as product;

class Medicine {
  final String id;
  final DateTime addedAt;

  Dosing dosing;
  bool archived = false;
  DateTime archivedAt;

  final MedicineData productData;
  final List<HistoryDose> doseHistory;

  Medicine(
      {@required this.id,
      @required this.addedAt,
      @required this.productData,
      this.dosing,
      this.archived,
      this.archivedAt,
      this.doseHistory = const []});

  factory Medicine.fromMedicinalProduct(product.MedicinalProductResponse response) {
    MedicineForm form;
    if (response.product.form == "tabletki powlekane") {
      form = MedicineForm.tablet;
    } else if (response.product.form == "kapsułki elastyczne") {
      form = MedicineForm.pill;
    } else if (response.product.form == "syrop") {
      form = MedicineForm.syrup;
    } else {
      form = MedicineForm.other;
    }

    return Medicine.create(
        productData: MedicineData(
            name: response.product.name,
            form: form,
            activeSubstances: response.product.activeSubstances.toList(),
            ean: response.ean,
            packageQuantity: response.product.packages
                .firstWhere((pack) => pack.ean == response.ean)
                .size));
  }

  factory Medicine.create({@required MedicineData productData, Dosing dosing}) {
    return Medicine(
        id: Uuid().v4(), addedAt: DateTime.now(), productData: productData);
  }
}

enum MedicineForm { pill, tablet, syrup, other }

class MedicineData {
  final String name;
  final MedicineForm form;
  final List<String> activeSubstances;
  final String ean;
  final int packageQuantity;

  const MedicineData(
      {@required this.name,
      @required this.form,
      @required this.activeSubstances,
      @required this.ean,
      @required this.packageQuantity});
}

enum DoseTime {
  morning,
  after_breakfast,
  before_noon,
  noon,
  after_lunch,
  before_dinner,
  after_dinner,
  before_sleep
}

enum HistoryDoseType { taken, taken_with_side_effects, skipped }

class HistoryDose {
  final DoseTime time;
  final DateTime addedAt;
  final String sideEffects;

  const HistoryDose(
      {@required this.time, @required this.addedAt, this.sideEffects});

  HistoryDoseType get type {
    if (addedAt == null) {
      return HistoryDoseType.skipped;
    }
    if (sideEffects != null && sideEffects != '') {
      return HistoryDoseType.taken_with_side_effects;
    }

    return HistoryDoseType.taken;
  }
}

enum DosingFrequency {
  daily,
  every_two_days,
  every_three_days,
  every_four_days,
  every_five_days,
  every_week
}

class Dosing {
  final DosingFrequency frequency;
  final List<DoseTime> times;

  const Dosing({@required this.frequency, @required this.times});
}
