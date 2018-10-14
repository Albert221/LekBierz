import 'package:lek_bierz/models/medicinal_product.dart';
import 'package:test/test.dart';
import 'package:lek_bierz/api/medicinal_products_repository.dart';

void main() {
  final repository = MedicinalProductsRepository();

  test('meds repo should response', () async {
    final testEan = '5909990149735';

    final MedicinalProductResponse response =
        await repository.getProductByEan(testEan);

    final MedicinalProduct meds = response.product;

    expect(response.ean, testEan);

    expect(meds.name, 'Rutinoscorbin');
    expect(meds.activeSubstances[0], 'Acidum ascorbicum');
    expect(meds.packages[0].ean, '5909990149759');
  });
}
