import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lek_bierz/models/medicinal_product.dart';
import 'package:lek_bierz/models/serializers.dart';

class MedicinalProductsRepository {
  static const String apiUrl = "https://publicdata.rocks/query";

  Future<MedicinalProductResponse> getProductByEan(String ean) {
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
        .then((body) => serializers.deserializeWith(
            MedicinalProductData.serializer, json.decode(body)))
        .then((data) => MedicinalProductResponse(ean, data.data.product));
  }
}
