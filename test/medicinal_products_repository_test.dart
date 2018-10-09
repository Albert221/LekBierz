import 'package:test/test.dart';
import 'package:lek_bierz/api/medicinal_products_repository.dart';

void main() {
  final repository = MedicinalProductsRepository();

  test('meds repo should response', () async {
    var meds = await repository.getProductByEan('5909990149735');

    expect(meds.name, 'Rutinoscorbin');
    expect(meds.activeSubstances[0], 'Acidum ascorbicum');
    expect(meds.packages[0].ean, '5909990149759');
  });
}