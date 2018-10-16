import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lek_bierz/models/medicinal_product.dart' as product;
import 'package:lek_bierz/models/serializers.dart';
import 'package:uuid/uuid.dart';

part 'state.g.dart';

abstract class LekBierzState
    implements Built<LekBierzState, LekBierzStateBuilder> {
  BuiltList<Medicine> get medicines;

  LekBierzState._();

  static Serializer<LekBierzState> get serializer => _$lekBierzStateSerializer;

  factory LekBierzState([updates(LekBierzStateBuilder b)]) = _$LekBierzState;

  Map toJSON() {
    return serializers.serialize(this);
  }
}

abstract class Medicine implements Built<Medicine, MedicineBuilder> {
  String get id;

  int get addedAt;

  @nullable
  Dosing get dosing;

  bool get archived;

  @nullable
  int get archivedAt;

  MedicineData get productData;

  BuiltList<HistoryDose> get doseHistory;

  Medicine._();

  static Serializer<Medicine> get serializer => _$medicineSerializer;

  factory Medicine([updates(MedicineBuilder b)]) = _$Medicine;

  factory Medicine.fromMedicinalProduct(
      product.MedicinalProductResponse response) {
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

    return Medicine((b) => b
      ..id = Uuid().v4()
      ..addedAt = DateTime.now().millisecondsSinceEpoch
      ..archived = false
      ..productData = MedicineData((b) => b
        ..name = response.product.name
        ..form = form
        ..ean = response.ean
        ..activeSubstances = response.product.activeSubstances.toBuilder()
        ..packageQuantity = response.product.packages
            .firstWhere((pack) => pack.ean == response.ean)
            .size).toBuilder()
      ..doseHistory = BuiltList<HistoryDose>().toBuilder());
  }
}

class MedicineForm extends EnumClass {
  static const MedicineForm pill = _$pill;
  static const MedicineForm tablet = _$tablet;
  static const MedicineForm syrup = _$syrup;
  static const MedicineForm other = _$other;

  const MedicineForm._(String name) : super(name);

  static Serializer<MedicineForm> get serializer => _$medicineFormSerializer;

  static BuiltSet<MedicineForm> get values => _$mfValues;

  static MedicineForm valueOf(String name) => _$mfValueOf(name);
}

abstract class MedicineData
    implements Built<MedicineData, MedicineDataBuilder> {
  String get name;

  MedicineForm get form;

  BuiltList<String> get activeSubstances;

  String get ean;

  int get packageQuantity;

  MedicineData._();

  static Serializer<MedicineData> get serializer => _$medicineDataSerializer;

  factory MedicineData([updates(MedicineDataBuilder b)]) = _$MedicineData;
}

class DoseTime extends EnumClass {
  static const DoseTime morning = _$morning;
  static const DoseTime afterBreakfast = _$afterBreakfast;
  static const DoseTime beforeNoon = _$beforeNoon;
  static const DoseTime noon = _$noon;
  static const DoseTime afterLunch = _$afterLunch;
  static const DoseTime beforeDinner = _$beforeDinner;
  static const DoseTime afterDinner = _$afterDinner;
  static const DoseTime beforeSleep = _$beforeSleep;

  const DoseTime._(String name) : super(name);

  static Serializer<DoseTime> get serializer => _$doseTimeSerializer;

  static BuiltSet<DoseTime> get values => _$dtValues;

  static DoseTime valueOf(String name) => _$dtValueOf(name);
}

class HistoryDoseStatus extends EnumClass {
  static const HistoryDoseStatus taken = _$taken;
  static const HistoryDoseStatus takenWithSideEffects = _$takenWithSideEffects;
  static const HistoryDoseStatus skipped = _$skipped;

  const HistoryDoseStatus._(String name) : super(name);

  static Serializer<HistoryDoseStatus> get serializer =>
      _$historyDoseStatusSerializer;

  static BuiltSet<HistoryDoseStatus> get values => _$hdsValues;

  static HistoryDoseStatus valueOf(String name) => _$hdsValueOf(name);
}

enum HistoryDoseType { taken, taken_with_side_effects, skipped }

abstract class HistoryDose implements Built<HistoryDose, HistoryDoseBuilder> {
  String get id;
  DoseTime get time;

  @nullable
  int get addedAt;

  @nullable
  String get sideEffects;

  HistoryDose._();

  static Serializer<HistoryDose> get serializer => _$historyDoseSerializer;

  factory HistoryDose([updates(HistoryDoseBuilder b)]) = _$HistoryDose;

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

class DosingFrequency extends EnumClass {
  static const DosingFrequency daily = _$daily;
  static const DosingFrequency everyTwoDays = _$everyTwoDays;
  static const DosingFrequency everyThreeDays = _$everyThreeDays;
  static const DosingFrequency everyFourDays = _$everyFourDays;
  static const DosingFrequency everyFiveDays = _$everyFiveDays;
  static const DosingFrequency everySixDays = _$everySixDays;
  static const DosingFrequency everyWeek = _$everyWeek;

  const DosingFrequency._(String name) : super(name);

  static Serializer<DosingFrequency> get serializer =>
      _$dosingFrequencySerializer;

  static BuiltSet<DosingFrequency> get values => _$dfValues;

  static DosingFrequency valueOf(String name) => _$dfValueOf(name);
}

abstract class Dosing implements Built<Dosing, DosingBuilder> {
  DosingFrequency get frequency;

  BuiltList<DoseTime> get times;

  Dosing._();

  static Serializer<Dosing> get serializer => _$dosingSerializer;

  factory Dosing([updates(DosingBuilder b)]) = _$Dosing;
}
