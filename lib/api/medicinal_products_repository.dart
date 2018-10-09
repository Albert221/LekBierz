import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MedicinalProduct {
  final String name;
  final String commonName;
  final String strength;
  final String form;
  final List<String> activeSubstances;
  final List<MedicinalProductPackage> packages;

  const MedicinalProduct(
      {this.name,
      this.commonName,
      this.strength,
      this.form,
      this.activeSubstances,
      this.packages});

  factory MedicinalProduct.fromJson(dynamic json) {
    assert(json is Map);
    assert(json['data'] is Map);

    if (json['data']['product'] == null) return null;

    final Map jsonProduct = json['data']['product'];
    assert(jsonProduct is Map);
    assert(jsonProduct['packages'] is List);

    return MedicinalProduct(
        name: jsonProduct['name'],
        commonName: jsonProduct['commonName'],
        strength: jsonProduct['strength'],
        form: jsonProduct['form'],
        activeSubstances: (jsonProduct['activeSubstances'] as List)
            .map((substance) => substance as String)
            .toList(),
        packages: (jsonProduct['packages'] as List)
            .map((jsonPackage) => MedicinalProductPackage(
                ean: jsonPackage['ean'],
                size: jsonPackage['size'],
                sizeUnit: jsonPackage['sizeUnit']))
            .toList());
  }
}

class MedicinalProductPackage {
  final String ean;
  final int size;
  final String sizeUnit;

  const MedicinalProductPackage({this.ean, this.size, this.sizeUnit});
}

class MedicinalProductsRepository {
  static const String apiUrl = "https://publicdata.rocks/query";

  Future<MedicinalProduct> getProductByEan(String ean) {
    return http
        .post(apiUrl,
            encoding: Encoding.getByName('application/json'),
            body: jsonEncode({
              "query": """
          {
            product(ean: "$ean") {
              name
              commonName
              strength
              form
              activeSubstances
              packages {
                ean
                size
                sizeUnit
              }
            }
          }
          """
            }))
        .then((response) => response.body)
        .then((body) => jsonDecode(body))
        .then((json) => MedicinalProduct.fromJson(json));
  }
}
