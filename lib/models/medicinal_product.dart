import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'medicinal_product.g.dart';

class MedicinalProductResponse {
  final String ean;
  final MedicinalProduct product;

  const MedicinalProductResponse(this.ean, this.product);
}

abstract class MedicinalProductData
    implements Built<MedicinalProductData, MedicinalProductDataBuilder> {
  MedicinalProductDataProduct get data;

  MedicinalProductData._();

  static Serializer<MedicinalProductData> get serializer =>
      _$medicinalProductDataSerializer;

  factory MedicinalProductData([updates(MedicinalProductDataBuilder b)]) =
      _$MedicinalProductData;
}

abstract class MedicinalProductDataProduct implements Built<MedicinalProductDataProduct, MedicinalProductDataProductBuilder> {
  @nullable
  MedicinalProduct get product;

  MedicinalProductDataProduct._();

  static Serializer<MedicinalProductDataProduct> get serializer =>
      _$medicinalProductDataProductSerializer;

  factory MedicinalProductDataProduct([updates(MedicinalProductDataProductBuilder b)]) =
  _$MedicinalProductDataProduct;
}

abstract class MedicinalProduct
    implements Built<MedicinalProduct, MedicinalProductBuilder> {
  String get name;

  String get commonName;

  String get strength;

  String get form;

  BuiltList<String> get activeSubstances;

  BuiltList<Package> get packages;

  MedicinalProduct._();

  static Serializer<MedicinalProduct> get serializer =>
      _$medicinalProductSerializer;

  factory MedicinalProduct([updates(MedicinalProductBuilder b)]) =
      _$MedicinalProduct;
}

abstract class Package implements Built<Package, PackageBuilder> {
  String get ean;

  int get size;

  String get sizeUnit;

  Package._();

  static Serializer<Package> get serializer => _$packageSerializer;

  factory Package([updates(PackageBuilder b)]) = _$Package;
}
