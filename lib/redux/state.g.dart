// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

const MedicineForm _$pill = const MedicineForm._('pill');
const MedicineForm _$tablet = const MedicineForm._('tablet');
const MedicineForm _$syrup = const MedicineForm._('syrup');
const MedicineForm _$other = const MedicineForm._('other');

MedicineForm _$mfValueOf(String name) {
  switch (name) {
    case 'pill':
      return _$pill;
    case 'tablet':
      return _$tablet;
    case 'syrup':
      return _$syrup;
    case 'other':
      return _$other;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<MedicineForm> _$mfValues =
    new BuiltSet<MedicineForm>(const <MedicineForm>[
  _$pill,
  _$tablet,
  _$syrup,
  _$other,
]);

const DoseTime _$morning = const DoseTime._('morning');
const DoseTime _$afterBreakfast = const DoseTime._('afterBreakfast');
const DoseTime _$beforeNoon = const DoseTime._('beforeNoon');
const DoseTime _$noon = const DoseTime._('noon');
const DoseTime _$afterLunch = const DoseTime._('afterLunch');
const DoseTime _$beforeDinner = const DoseTime._('beforeDinner');
const DoseTime _$afterDinner = const DoseTime._('afterDinner');
const DoseTime _$beforeSleep = const DoseTime._('beforeSleep');

DoseTime _$dtValueOf(String name) {
  switch (name) {
    case 'morning':
      return _$morning;
    case 'afterBreakfast':
      return _$afterBreakfast;
    case 'beforeNoon':
      return _$beforeNoon;
    case 'noon':
      return _$noon;
    case 'afterLunch':
      return _$afterLunch;
    case 'beforeDinner':
      return _$beforeDinner;
    case 'afterDinner':
      return _$afterDinner;
    case 'beforeSleep':
      return _$beforeSleep;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<DoseTime> _$dtValues = new BuiltSet<DoseTime>(const <DoseTime>[
  _$morning,
  _$afterBreakfast,
  _$beforeNoon,
  _$noon,
  _$afterLunch,
  _$beforeDinner,
  _$afterDinner,
  _$beforeSleep,
]);

const HistoryDoseStatus _$taken = const HistoryDoseStatus._('taken');
const HistoryDoseStatus _$takenWithSideEffects =
    const HistoryDoseStatus._('takenWithSideEffects');
const HistoryDoseStatus _$skipped = const HistoryDoseStatus._('skipped');

HistoryDoseStatus _$hdsValueOf(String name) {
  switch (name) {
    case 'taken':
      return _$taken;
    case 'takenWithSideEffects':
      return _$takenWithSideEffects;
    case 'skipped':
      return _$skipped;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<HistoryDoseStatus> _$hdsValues =
    new BuiltSet<HistoryDoseStatus>(const <HistoryDoseStatus>[
  _$taken,
  _$takenWithSideEffects,
  _$skipped,
]);

const DosingFrequency _$daily = const DosingFrequency._('daily');
const DosingFrequency _$everyTwoDays = const DosingFrequency._('everyTwoDays');
const DosingFrequency _$everyThreeDays =
    const DosingFrequency._('everyThreeDays');
const DosingFrequency _$everyFourDays =
    const DosingFrequency._('everyFourDays');
const DosingFrequency _$everyFiveDays =
    const DosingFrequency._('everyFiveDays');
const DosingFrequency _$everySixDays = const DosingFrequency._('everySixDays');
const DosingFrequency _$everyWeek = const DosingFrequency._('everyWeek');

DosingFrequency _$dfValueOf(String name) {
  switch (name) {
    case 'daily':
      return _$daily;
    case 'everyTwoDays':
      return _$everyTwoDays;
    case 'everyThreeDays':
      return _$everyThreeDays;
    case 'everyFourDays':
      return _$everyFourDays;
    case 'everyFiveDays':
      return _$everyFiveDays;
    case 'everySixDays':
      return _$everySixDays;
    case 'everyWeek':
      return _$everyWeek;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<DosingFrequency> _$dfValues =
    new BuiltSet<DosingFrequency>(const <DosingFrequency>[
  _$daily,
  _$everyTwoDays,
  _$everyThreeDays,
  _$everyFourDays,
  _$everyFiveDays,
  _$everySixDays,
  _$everyWeek,
]);

Serializer<LekBierzState> _$lekBierzStateSerializer =
    new _$LekBierzStateSerializer();
Serializer<Medicine> _$medicineSerializer = new _$MedicineSerializer();
Serializer<MedicineForm> _$medicineFormSerializer =
    new _$MedicineFormSerializer();
Serializer<MedicineData> _$medicineDataSerializer =
    new _$MedicineDataSerializer();
Serializer<DoseTime> _$doseTimeSerializer = new _$DoseTimeSerializer();
Serializer<HistoryDoseStatus> _$historyDoseStatusSerializer =
    new _$HistoryDoseStatusSerializer();
Serializer<HistoryDose> _$historyDoseSerializer = new _$HistoryDoseSerializer();
Serializer<DosingFrequency> _$dosingFrequencySerializer =
    new _$DosingFrequencySerializer();
Serializer<Dosing> _$dosingSerializer = new _$DosingSerializer();

class _$LekBierzStateSerializer implements StructuredSerializer<LekBierzState> {
  @override
  final Iterable<Type> types = const [LekBierzState, _$LekBierzState];
  @override
  final String wireName = 'LekBierzState';

  @override
  Iterable serialize(Serializers serializers, LekBierzState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'medicines',
      serializers.serialize(object.medicines,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Medicine)])),
    ];

    return result;
  }

  @override
  LekBierzState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LekBierzStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'medicines':
          result.medicines.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Medicine)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$MedicineSerializer implements StructuredSerializer<Medicine> {
  @override
  final Iterable<Type> types = const [Medicine, _$Medicine];
  @override
  final String wireName = 'Medicine';

  @override
  Iterable serialize(Serializers serializers, Medicine object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'addedAt',
      serializers.serialize(object.addedAt, specifiedType: const FullType(int)),
      'archived',
      serializers.serialize(object.archived,
          specifiedType: const FullType(bool)),
      'productData',
      serializers.serialize(object.productData,
          specifiedType: const FullType(MedicineData)),
      'doseHistory',
      serializers.serialize(object.doseHistory,
          specifiedType:
              const FullType(BuiltList, const [const FullType(HistoryDose)])),
    ];
    if (object.dosing != null) {
      result
        ..add('dosing')
        ..add(serializers.serialize(object.dosing,
            specifiedType: const FullType(Dosing)));
    }
    if (object.archivedAt != null) {
      result
        ..add('archivedAt')
        ..add(serializers.serialize(object.archivedAt,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  Medicine deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MedicineBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'addedAt':
          result.addedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'dosing':
          result.dosing.replace(serializers.deserialize(value,
              specifiedType: const FullType(Dosing)) as Dosing);
          break;
        case 'archived':
          result.archived = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'archivedAt':
          result.archivedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'productData':
          result.productData.replace(serializers.deserialize(value,
              specifiedType: const FullType(MedicineData)) as MedicineData);
          break;
        case 'doseHistory':
          result.doseHistory.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(HistoryDose)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$MedicineFormSerializer implements PrimitiveSerializer<MedicineForm> {
  @override
  final Iterable<Type> types = const <Type>[MedicineForm];
  @override
  final String wireName = 'MedicineForm';

  @override
  Object serialize(Serializers serializers, MedicineForm object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  MedicineForm deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MedicineForm.valueOf(serialized as String);
}

class _$MedicineDataSerializer implements StructuredSerializer<MedicineData> {
  @override
  final Iterable<Type> types = const [MedicineData, _$MedicineData];
  @override
  final String wireName = 'MedicineData';

  @override
  Iterable serialize(Serializers serializers, MedicineData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'form',
      serializers.serialize(object.form,
          specifiedType: const FullType(MedicineForm)),
      'activeSubstances',
      serializers.serialize(object.activeSubstances,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'ean',
      serializers.serialize(object.ean, specifiedType: const FullType(String)),
      'packageQuantity',
      serializers.serialize(object.packageQuantity,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  MedicineData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MedicineDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'form':
          result.form = serializers.deserialize(value,
              specifiedType: const FullType(MedicineForm)) as MedicineForm;
          break;
        case 'activeSubstances':
          result.activeSubstances.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'ean':
          result.ean = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'packageQuantity':
          result.packageQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$DoseTimeSerializer implements PrimitiveSerializer<DoseTime> {
  @override
  final Iterable<Type> types = const <Type>[DoseTime];
  @override
  final String wireName = 'DoseTime';

  @override
  Object serialize(Serializers serializers, DoseTime object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  DoseTime deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DoseTime.valueOf(serialized as String);
}

class _$HistoryDoseStatusSerializer
    implements PrimitiveSerializer<HistoryDoseStatus> {
  @override
  final Iterable<Type> types = const <Type>[HistoryDoseStatus];
  @override
  final String wireName = 'HistoryDoseStatus';

  @override
  Object serialize(Serializers serializers, HistoryDoseStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  HistoryDoseStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      HistoryDoseStatus.valueOf(serialized as String);
}

class _$HistoryDoseSerializer implements StructuredSerializer<HistoryDose> {
  @override
  final Iterable<Type> types = const [HistoryDose, _$HistoryDose];
  @override
  final String wireName = 'HistoryDose';

  @override
  Iterable serialize(Serializers serializers, HistoryDose object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'time',
      serializers.serialize(object.time,
          specifiedType: const FullType(DoseTime)),
    ];
    if (object.addedAt != null) {
      result
        ..add('addedAt')
        ..add(serializers.serialize(object.addedAt,
            specifiedType: const FullType(int)));
    }
    if (object.sideEffects != null) {
      result
        ..add('sideEffects')
        ..add(serializers.serialize(object.sideEffects,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  HistoryDose deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HistoryDoseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DoseTime)) as DoseTime;
          break;
        case 'addedAt':
          result.addedAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'sideEffects':
          result.sideEffects = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DosingFrequencySerializer
    implements PrimitiveSerializer<DosingFrequency> {
  @override
  final Iterable<Type> types = const <Type>[DosingFrequency];
  @override
  final String wireName = 'DosingFrequency';

  @override
  Object serialize(Serializers serializers, DosingFrequency object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  DosingFrequency deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DosingFrequency.valueOf(serialized as String);
}

class _$DosingSerializer implements StructuredSerializer<Dosing> {
  @override
  final Iterable<Type> types = const [Dosing, _$Dosing];
  @override
  final String wireName = 'Dosing';

  @override
  Iterable serialize(Serializers serializers, Dosing object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'frequency',
      serializers.serialize(object.frequency,
          specifiedType: const FullType(DosingFrequency)),
      'times',
      serializers.serialize(object.times,
          specifiedType:
              const FullType(BuiltList, const [const FullType(DoseTime)])),
    ];

    return result;
  }

  @override
  Dosing deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DosingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'frequency':
          result.frequency = serializers.deserialize(value,
                  specifiedType: const FullType(DosingFrequency))
              as DosingFrequency;
          break;
        case 'times':
          result.times.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(DoseTime)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$LekBierzState extends LekBierzState {
  @override
  final BuiltList<Medicine> medicines;

  factory _$LekBierzState([void updates(LekBierzStateBuilder b)]) =>
      (new LekBierzStateBuilder()..update(updates)).build();

  _$LekBierzState._({this.medicines}) : super._() {
    if (medicines == null) {
      throw new BuiltValueNullFieldError('LekBierzState', 'medicines');
    }
  }

  @override
  LekBierzState rebuild(void updates(LekBierzStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LekBierzStateBuilder toBuilder() => new LekBierzStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LekBierzState && medicines == other.medicines;
  }

  @override
  int get hashCode {
    return $jf($jc(0, medicines.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LekBierzState')
          ..add('medicines', medicines))
        .toString();
  }
}

class LekBierzStateBuilder
    implements Builder<LekBierzState, LekBierzStateBuilder> {
  _$LekBierzState _$v;

  ListBuilder<Medicine> _medicines;
  ListBuilder<Medicine> get medicines =>
      _$this._medicines ??= new ListBuilder<Medicine>();
  set medicines(ListBuilder<Medicine> medicines) =>
      _$this._medicines = medicines;

  LekBierzStateBuilder();

  LekBierzStateBuilder get _$this {
    if (_$v != null) {
      _medicines = _$v.medicines?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LekBierzState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LekBierzState;
  }

  @override
  void update(void updates(LekBierzStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LekBierzState build() {
    _$LekBierzState _$result;
    try {
      _$result = _$v ?? new _$LekBierzState._(medicines: medicines.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'medicines';
        medicines.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LekBierzState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Medicine extends Medicine {
  @override
  final String id;
  @override
  final int addedAt;
  @override
  final Dosing dosing;
  @override
  final bool archived;
  @override
  final int archivedAt;
  @override
  final MedicineData productData;
  @override
  final BuiltList<HistoryDose> doseHistory;

  factory _$Medicine([void updates(MedicineBuilder b)]) =>
      (new MedicineBuilder()..update(updates)).build();

  _$Medicine._(
      {this.id,
      this.addedAt,
      this.dosing,
      this.archived,
      this.archivedAt,
      this.productData,
      this.doseHistory})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Medicine', 'id');
    }
    if (addedAt == null) {
      throw new BuiltValueNullFieldError('Medicine', 'addedAt');
    }
    if (archived == null) {
      throw new BuiltValueNullFieldError('Medicine', 'archived');
    }
    if (productData == null) {
      throw new BuiltValueNullFieldError('Medicine', 'productData');
    }
    if (doseHistory == null) {
      throw new BuiltValueNullFieldError('Medicine', 'doseHistory');
    }
  }

  @override
  Medicine rebuild(void updates(MedicineBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicineBuilder toBuilder() => new MedicineBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Medicine &&
        id == other.id &&
        addedAt == other.addedAt &&
        dosing == other.dosing &&
        archived == other.archived &&
        archivedAt == other.archivedAt &&
        productData == other.productData &&
        doseHistory == other.doseHistory;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), addedAt.hashCode),
                        dosing.hashCode),
                    archived.hashCode),
                archivedAt.hashCode),
            productData.hashCode),
        doseHistory.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Medicine')
          ..add('id', id)
          ..add('addedAt', addedAt)
          ..add('dosing', dosing)
          ..add('archived', archived)
          ..add('archivedAt', archivedAt)
          ..add('productData', productData)
          ..add('doseHistory', doseHistory))
        .toString();
  }
}

class MedicineBuilder implements Builder<Medicine, MedicineBuilder> {
  _$Medicine _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  int _addedAt;
  int get addedAt => _$this._addedAt;
  set addedAt(int addedAt) => _$this._addedAt = addedAt;

  DosingBuilder _dosing;
  DosingBuilder get dosing => _$this._dosing ??= new DosingBuilder();
  set dosing(DosingBuilder dosing) => _$this._dosing = dosing;

  bool _archived;
  bool get archived => _$this._archived;
  set archived(bool archived) => _$this._archived = archived;

  int _archivedAt;
  int get archivedAt => _$this._archivedAt;
  set archivedAt(int archivedAt) => _$this._archivedAt = archivedAt;

  MedicineDataBuilder _productData;
  MedicineDataBuilder get productData =>
      _$this._productData ??= new MedicineDataBuilder();
  set productData(MedicineDataBuilder productData) =>
      _$this._productData = productData;

  ListBuilder<HistoryDose> _doseHistory;
  ListBuilder<HistoryDose> get doseHistory =>
      _$this._doseHistory ??= new ListBuilder<HistoryDose>();
  set doseHistory(ListBuilder<HistoryDose> doseHistory) =>
      _$this._doseHistory = doseHistory;

  MedicineBuilder();

  MedicineBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _addedAt = _$v.addedAt;
      _dosing = _$v.dosing?.toBuilder();
      _archived = _$v.archived;
      _archivedAt = _$v.archivedAt;
      _productData = _$v.productData?.toBuilder();
      _doseHistory = _$v.doseHistory?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Medicine other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Medicine;
  }

  @override
  void update(void updates(MedicineBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Medicine build() {
    _$Medicine _$result;
    try {
      _$result = _$v ??
          new _$Medicine._(
              id: id,
              addedAt: addedAt,
              dosing: _dosing?.build(),
              archived: archived,
              archivedAt: archivedAt,
              productData: productData.build(),
              doseHistory: doseHistory.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'dosing';
        _dosing?.build();

        _$failedField = 'productData';
        productData.build();
        _$failedField = 'doseHistory';
        doseHistory.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Medicine', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MedicineData extends MedicineData {
  @override
  final String name;
  @override
  final MedicineForm form;
  @override
  final BuiltList<String> activeSubstances;
  @override
  final String ean;
  @override
  final int packageQuantity;

  factory _$MedicineData([void updates(MedicineDataBuilder b)]) =>
      (new MedicineDataBuilder()..update(updates)).build();

  _$MedicineData._(
      {this.name,
      this.form,
      this.activeSubstances,
      this.ean,
      this.packageQuantity})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('MedicineData', 'name');
    }
    if (form == null) {
      throw new BuiltValueNullFieldError('MedicineData', 'form');
    }
    if (activeSubstances == null) {
      throw new BuiltValueNullFieldError('MedicineData', 'activeSubstances');
    }
    if (ean == null) {
      throw new BuiltValueNullFieldError('MedicineData', 'ean');
    }
    if (packageQuantity == null) {
      throw new BuiltValueNullFieldError('MedicineData', 'packageQuantity');
    }
  }

  @override
  MedicineData rebuild(void updates(MedicineDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicineDataBuilder toBuilder() => new MedicineDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedicineData &&
        name == other.name &&
        form == other.form &&
        activeSubstances == other.activeSubstances &&
        ean == other.ean &&
        packageQuantity == other.packageQuantity;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, name.hashCode), form.hashCode),
                activeSubstances.hashCode),
            ean.hashCode),
        packageQuantity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MedicineData')
          ..add('name', name)
          ..add('form', form)
          ..add('activeSubstances', activeSubstances)
          ..add('ean', ean)
          ..add('packageQuantity', packageQuantity))
        .toString();
  }
}

class MedicineDataBuilder
    implements Builder<MedicineData, MedicineDataBuilder> {
  _$MedicineData _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  MedicineForm _form;
  MedicineForm get form => _$this._form;
  set form(MedicineForm form) => _$this._form = form;

  ListBuilder<String> _activeSubstances;
  ListBuilder<String> get activeSubstances =>
      _$this._activeSubstances ??= new ListBuilder<String>();
  set activeSubstances(ListBuilder<String> activeSubstances) =>
      _$this._activeSubstances = activeSubstances;

  String _ean;
  String get ean => _$this._ean;
  set ean(String ean) => _$this._ean = ean;

  int _packageQuantity;
  int get packageQuantity => _$this._packageQuantity;
  set packageQuantity(int packageQuantity) =>
      _$this._packageQuantity = packageQuantity;

  MedicineDataBuilder();

  MedicineDataBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _form = _$v.form;
      _activeSubstances = _$v.activeSubstances?.toBuilder();
      _ean = _$v.ean;
      _packageQuantity = _$v.packageQuantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedicineData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MedicineData;
  }

  @override
  void update(void updates(MedicineDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MedicineData build() {
    _$MedicineData _$result;
    try {
      _$result = _$v ??
          new _$MedicineData._(
              name: name,
              form: form,
              activeSubstances: activeSubstances.build(),
              ean: ean,
              packageQuantity: packageQuantity);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'activeSubstances';
        activeSubstances.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MedicineData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$HistoryDose extends HistoryDose {
  @override
  final String id;
  @override
  final DoseTime time;
  @override
  final int addedAt;
  @override
  final String sideEffects;

  factory _$HistoryDose([void updates(HistoryDoseBuilder b)]) =>
      (new HistoryDoseBuilder()..update(updates)).build();

  _$HistoryDose._({this.id, this.time, this.addedAt, this.sideEffects})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('HistoryDose', 'id');
    }
    if (time == null) {
      throw new BuiltValueNullFieldError('HistoryDose', 'time');
    }
  }

  @override
  HistoryDose rebuild(void updates(HistoryDoseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryDoseBuilder toBuilder() => new HistoryDoseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryDose &&
        id == other.id &&
        time == other.time &&
        addedAt == other.addedAt &&
        sideEffects == other.sideEffects;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), time.hashCode), addedAt.hashCode),
        sideEffects.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HistoryDose')
          ..add('id', id)
          ..add('time', time)
          ..add('addedAt', addedAt)
          ..add('sideEffects', sideEffects))
        .toString();
  }
}

class HistoryDoseBuilder implements Builder<HistoryDose, HistoryDoseBuilder> {
  _$HistoryDose _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  DoseTime _time;
  DoseTime get time => _$this._time;
  set time(DoseTime time) => _$this._time = time;

  int _addedAt;
  int get addedAt => _$this._addedAt;
  set addedAt(int addedAt) => _$this._addedAt = addedAt;

  String _sideEffects;
  String get sideEffects => _$this._sideEffects;
  set sideEffects(String sideEffects) => _$this._sideEffects = sideEffects;

  HistoryDoseBuilder();

  HistoryDoseBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _time = _$v.time;
      _addedAt = _$v.addedAt;
      _sideEffects = _$v.sideEffects;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryDose other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HistoryDose;
  }

  @override
  void update(void updates(HistoryDoseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$HistoryDose build() {
    final _$result = _$v ??
        new _$HistoryDose._(
            id: id, time: time, addedAt: addedAt, sideEffects: sideEffects);
    replace(_$result);
    return _$result;
  }
}

class _$Dosing extends Dosing {
  @override
  final DosingFrequency frequency;
  @override
  final BuiltList<DoseTime> times;

  factory _$Dosing([void updates(DosingBuilder b)]) =>
      (new DosingBuilder()..update(updates)).build();

  _$Dosing._({this.frequency, this.times}) : super._() {
    if (frequency == null) {
      throw new BuiltValueNullFieldError('Dosing', 'frequency');
    }
    if (times == null) {
      throw new BuiltValueNullFieldError('Dosing', 'times');
    }
  }

  @override
  Dosing rebuild(void updates(DosingBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DosingBuilder toBuilder() => new DosingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Dosing &&
        frequency == other.frequency &&
        times == other.times;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, frequency.hashCode), times.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Dosing')
          ..add('frequency', frequency)
          ..add('times', times))
        .toString();
  }
}

class DosingBuilder implements Builder<Dosing, DosingBuilder> {
  _$Dosing _$v;

  DosingFrequency _frequency;
  DosingFrequency get frequency => _$this._frequency;
  set frequency(DosingFrequency frequency) => _$this._frequency = frequency;

  ListBuilder<DoseTime> _times;
  ListBuilder<DoseTime> get times =>
      _$this._times ??= new ListBuilder<DoseTime>();
  set times(ListBuilder<DoseTime> times) => _$this._times = times;

  DosingBuilder();

  DosingBuilder get _$this {
    if (_$v != null) {
      _frequency = _$v.frequency;
      _times = _$v.times?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Dosing other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Dosing;
  }

  @override
  void update(void updates(DosingBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Dosing build() {
    _$Dosing _$result;
    try {
      _$result =
          _$v ?? new _$Dosing._(frequency: frequency, times: times.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'times';
        times.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Dosing', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
