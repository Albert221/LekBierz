import 'package:lek_bierz/api/medicinal_products_repository.dart';
import 'package:lek_bierz/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:lek_bierz/redux/state.dart';

class EanScanner {
  final _medicinalProductsRepository;
  Function onWorkStarted;
  Function onWorkEnded;

  EanScanner({this.onWorkStarted, this.onWorkEnded})
      : _medicinalProductsRepository = MedicinalProductsRepository();

  Future<bool> doStuff(Store<LekBierzState> store) async {
    try {
      // Get barcode
      String barcode = await BarcodeScanner.scan();
      if (onWorkStarted != null) onWorkStarted();

      final response =
          await _medicinalProductsRepository.getProductByEan(barcode);

      if (onWorkEnded != null) onWorkEnded();

      if (response == null || response.product == null) {
        return false;
      }

      store
          .dispatch(AddMedicineAction(Medicine.fromMedicinalProduct(response)));
    } on PlatformException catch (e) {
      print(e.toString());
    } on FormatException {}

    return true;
  }
}
