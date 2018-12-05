// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

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

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(DoseTime.serializer)
      ..add(Dosing.serializer)
      ..add(DosingFrequency.serializer)
      ..add(HistoryDose.serializer)
      ..add(LekBierzState.serializer)
      ..add(MedicinalProduct.serializer)
      ..add(MedicinalProductData.serializer)
      ..add(MedicinalProductDataProduct.serializer)
      ..add(Medicine.serializer)
      ..add(MedicineData.serializer)
      ..add(MedicineForm.serializer)
      ..add(Package.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DoseTime)]),
          () => new ListBuilder<DoseTime>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(HistoryDose)]),
          () => new ListBuilder<HistoryDose>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Medicine)]),
          () => new ListBuilder<Medicine>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(DoseTime), const FullType(Duration)]),
          () => new MapBuilder<DoseTime, Duration>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Package)]),
          () => new ListBuilder<Package>()))
    .build();
