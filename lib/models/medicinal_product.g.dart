// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicinal_product.dart';

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

Serializer<MedicinalProductData> _$medicinalProductDataSerializer =
    new _$MedicinalProductDataSerializer();
Serializer<MedicinalProductDataProduct>
    _$medicinalProductDataProductSerializer =
    new _$MedicinalProductDataProductSerializer();
Serializer<MedicinalProduct> _$medicinalProductSerializer =
    new _$MedicinalProductSerializer();
Serializer<Package> _$packageSerializer = new _$PackageSerializer();

class _$MedicinalProductDataSerializer
    implements StructuredSerializer<MedicinalProductData> {
  @override
  final Iterable<Type> types = const [
    MedicinalProductData,
    _$MedicinalProductData
  ];
  @override
  final String wireName = 'MedicinalProductData';

  @override
  Iterable serialize(Serializers serializers, MedicinalProductData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(MedicinalProductDataProduct)),
    ];

    return result;
  }

  @override
  MedicinalProductData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MedicinalProductDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(MedicinalProductDataProduct))
              as MedicinalProductDataProduct);
          break;
      }
    }

    return result.build();
  }
}

class _$MedicinalProductDataProductSerializer
    implements StructuredSerializer<MedicinalProductDataProduct> {
  @override
  final Iterable<Type> types = const [
    MedicinalProductDataProduct,
    _$MedicinalProductDataProduct
  ];
  @override
  final String wireName = 'MedicinalProductDataProduct';

  @override
  Iterable serialize(
      Serializers serializers, MedicinalProductDataProduct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.product != null) {
      result
        ..add('product')
        ..add(serializers.serialize(object.product,
            specifiedType: const FullType(MedicinalProduct)));
    }

    return result;
  }

  @override
  MedicinalProductDataProduct deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MedicinalProductDataProductBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'product':
          result.product.replace(serializers.deserialize(value,
                  specifiedType: const FullType(MedicinalProduct))
              as MedicinalProduct);
          break;
      }
    }

    return result.build();
  }
}

class _$MedicinalProductSerializer
    implements StructuredSerializer<MedicinalProduct> {
  @override
  final Iterable<Type> types = const [MedicinalProduct, _$MedicinalProduct];
  @override
  final String wireName = 'MedicinalProduct';

  @override
  Iterable serialize(Serializers serializers, MedicinalProduct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'commonName',
      serializers.serialize(object.commonName,
          specifiedType: const FullType(String)),
      'strength',
      serializers.serialize(object.strength,
          specifiedType: const FullType(String)),
      'form',
      serializers.serialize(object.form, specifiedType: const FullType(String)),
      'activeSubstances',
      serializers.serialize(object.activeSubstances,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'packages',
      serializers.serialize(object.packages,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Package)])),
    ];

    return result;
  }

  @override
  MedicinalProduct deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MedicinalProductBuilder();

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
        case 'commonName':
          result.commonName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'strength':
          result.strength = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'form':
          result.form = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'activeSubstances':
          result.activeSubstances.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'packages':
          result.packages.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Package)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$PackageSerializer implements StructuredSerializer<Package> {
  @override
  final Iterable<Type> types = const [Package, _$Package];
  @override
  final String wireName = 'Package';

  @override
  Iterable serialize(Serializers serializers, Package object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'ean',
      serializers.serialize(object.ean, specifiedType: const FullType(String)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(int)),
      'sizeUnit',
      serializers.serialize(object.sizeUnit,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Package deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PackageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'ean':
          result.ean = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'sizeUnit':
          result.sizeUnit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MedicinalProductData extends MedicinalProductData {
  @override
  final MedicinalProductDataProduct data;

  factory _$MedicinalProductData(
          [void updates(MedicinalProductDataBuilder b)]) =>
      (new MedicinalProductDataBuilder()..update(updates)).build();

  _$MedicinalProductData._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('MedicinalProductData', 'data');
    }
  }

  @override
  MedicinalProductData rebuild(void updates(MedicinalProductDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicinalProductDataBuilder toBuilder() =>
      new MedicinalProductDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedicinalProductData && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MedicinalProductData')
          ..add('data', data))
        .toString();
  }
}

class MedicinalProductDataBuilder
    implements Builder<MedicinalProductData, MedicinalProductDataBuilder> {
  _$MedicinalProductData _$v;

  MedicinalProductDataProductBuilder _data;
  MedicinalProductDataProductBuilder get data =>
      _$this._data ??= new MedicinalProductDataProductBuilder();
  set data(MedicinalProductDataProductBuilder data) => _$this._data = data;

  MedicinalProductDataBuilder();

  MedicinalProductDataBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedicinalProductData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MedicinalProductData;
  }

  @override
  void update(void updates(MedicinalProductDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MedicinalProductData build() {
    _$MedicinalProductData _$result;
    try {
      _$result = _$v ?? new _$MedicinalProductData._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MedicinalProductData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MedicinalProductDataProduct extends MedicinalProductDataProduct {
  @override
  final MedicinalProduct product;

  factory _$MedicinalProductDataProduct(
          [void updates(MedicinalProductDataProductBuilder b)]) =>
      (new MedicinalProductDataProductBuilder()..update(updates)).build();

  _$MedicinalProductDataProduct._({this.product}) : super._();

  @override
  MedicinalProductDataProduct rebuild(
          void updates(MedicinalProductDataProductBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicinalProductDataProductBuilder toBuilder() =>
      new MedicinalProductDataProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedicinalProductDataProduct && product == other.product;
  }

  @override
  int get hashCode {
    return $jf($jc(0, product.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MedicinalProductDataProduct')
          ..add('product', product))
        .toString();
  }
}

class MedicinalProductDataProductBuilder
    implements
        Builder<MedicinalProductDataProduct,
            MedicinalProductDataProductBuilder> {
  _$MedicinalProductDataProduct _$v;

  MedicinalProductBuilder _product;
  MedicinalProductBuilder get product =>
      _$this._product ??= new MedicinalProductBuilder();
  set product(MedicinalProductBuilder product) => _$this._product = product;

  MedicinalProductDataProductBuilder();

  MedicinalProductDataProductBuilder get _$this {
    if (_$v != null) {
      _product = _$v.product?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedicinalProductDataProduct other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MedicinalProductDataProduct;
  }

  @override
  void update(void updates(MedicinalProductDataProductBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MedicinalProductDataProduct build() {
    _$MedicinalProductDataProduct _$result;
    try {
      _$result = _$v ??
          new _$MedicinalProductDataProduct._(product: _product?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'product';
        _product?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MedicinalProductDataProduct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MedicinalProduct extends MedicinalProduct {
  @override
  final String name;
  @override
  final String commonName;
  @override
  final String strength;
  @override
  final String form;
  @override
  final BuiltList<String> activeSubstances;
  @override
  final BuiltList<Package> packages;

  factory _$MedicinalProduct([void updates(MedicinalProductBuilder b)]) =>
      (new MedicinalProductBuilder()..update(updates)).build();

  _$MedicinalProduct._(
      {this.name,
      this.commonName,
      this.strength,
      this.form,
      this.activeSubstances,
      this.packages})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('MedicinalProduct', 'name');
    }
    if (commonName == null) {
      throw new BuiltValueNullFieldError('MedicinalProduct', 'commonName');
    }
    if (strength == null) {
      throw new BuiltValueNullFieldError('MedicinalProduct', 'strength');
    }
    if (form == null) {
      throw new BuiltValueNullFieldError('MedicinalProduct', 'form');
    }
    if (activeSubstances == null) {
      throw new BuiltValueNullFieldError(
          'MedicinalProduct', 'activeSubstances');
    }
    if (packages == null) {
      throw new BuiltValueNullFieldError('MedicinalProduct', 'packages');
    }
  }

  @override
  MedicinalProduct rebuild(void updates(MedicinalProductBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicinalProductBuilder toBuilder() =>
      new MedicinalProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedicinalProduct &&
        name == other.name &&
        commonName == other.commonName &&
        strength == other.strength &&
        form == other.form &&
        activeSubstances == other.activeSubstances &&
        packages == other.packages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), commonName.hashCode),
                    strength.hashCode),
                form.hashCode),
            activeSubstances.hashCode),
        packages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MedicinalProduct')
          ..add('name', name)
          ..add('commonName', commonName)
          ..add('strength', strength)
          ..add('form', form)
          ..add('activeSubstances', activeSubstances)
          ..add('packages', packages))
        .toString();
  }
}

class MedicinalProductBuilder
    implements Builder<MedicinalProduct, MedicinalProductBuilder> {
  _$MedicinalProduct _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _commonName;
  String get commonName => _$this._commonName;
  set commonName(String commonName) => _$this._commonName = commonName;

  String _strength;
  String get strength => _$this._strength;
  set strength(String strength) => _$this._strength = strength;

  String _form;
  String get form => _$this._form;
  set form(String form) => _$this._form = form;

  ListBuilder<String> _activeSubstances;
  ListBuilder<String> get activeSubstances =>
      _$this._activeSubstances ??= new ListBuilder<String>();
  set activeSubstances(ListBuilder<String> activeSubstances) =>
      _$this._activeSubstances = activeSubstances;

  ListBuilder<Package> _packages;
  ListBuilder<Package> get packages =>
      _$this._packages ??= new ListBuilder<Package>();
  set packages(ListBuilder<Package> packages) => _$this._packages = packages;

  MedicinalProductBuilder();

  MedicinalProductBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _commonName = _$v.commonName;
      _strength = _$v.strength;
      _form = _$v.form;
      _activeSubstances = _$v.activeSubstances?.toBuilder();
      _packages = _$v.packages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedicinalProduct other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MedicinalProduct;
  }

  @override
  void update(void updates(MedicinalProductBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MedicinalProduct build() {
    _$MedicinalProduct _$result;
    try {
      _$result = _$v ??
          new _$MedicinalProduct._(
              name: name,
              commonName: commonName,
              strength: strength,
              form: form,
              activeSubstances: activeSubstances.build(),
              packages: packages.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'activeSubstances';
        activeSubstances.build();
        _$failedField = 'packages';
        packages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MedicinalProduct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Package extends Package {
  @override
  final String ean;
  @override
  final int size;
  @override
  final String sizeUnit;

  factory _$Package([void updates(PackageBuilder b)]) =>
      (new PackageBuilder()..update(updates)).build();

  _$Package._({this.ean, this.size, this.sizeUnit}) : super._() {
    if (ean == null) {
      throw new BuiltValueNullFieldError('Package', 'ean');
    }
    if (size == null) {
      throw new BuiltValueNullFieldError('Package', 'size');
    }
    if (sizeUnit == null) {
      throw new BuiltValueNullFieldError('Package', 'sizeUnit');
    }
  }

  @override
  Package rebuild(void updates(PackageBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PackageBuilder toBuilder() => new PackageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Package &&
        ean == other.ean &&
        size == other.size &&
        sizeUnit == other.sizeUnit;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, ean.hashCode), size.hashCode), sizeUnit.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Package')
          ..add('ean', ean)
          ..add('size', size)
          ..add('sizeUnit', sizeUnit))
        .toString();
  }
}

class PackageBuilder implements Builder<Package, PackageBuilder> {
  _$Package _$v;

  String _ean;
  String get ean => _$this._ean;
  set ean(String ean) => _$this._ean = ean;

  int _size;
  int get size => _$this._size;
  set size(int size) => _$this._size = size;

  String _sizeUnit;
  String get sizeUnit => _$this._sizeUnit;
  set sizeUnit(String sizeUnit) => _$this._sizeUnit = sizeUnit;

  PackageBuilder();

  PackageBuilder get _$this {
    if (_$v != null) {
      _ean = _$v.ean;
      _size = _$v.size;
      _sizeUnit = _$v.sizeUnit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Package other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Package;
  }

  @override
  void update(void updates(PackageBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Package build() {
    final _$result =
        _$v ?? new _$Package._(ean: ean, size: size, sizeUnit: sizeUnit);
    replace(_$result);
    return _$result;
  }
}
