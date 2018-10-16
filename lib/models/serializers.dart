import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:lek_bierz/models/medicinal_product.dart';
import 'package:lek_bierz/redux/state.dart';

part 'serializers.g.dart';

@SerializersFor(const [MedicinalProductData, LekBierzState])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
