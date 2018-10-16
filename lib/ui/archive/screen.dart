import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/ui/common/app_bar.dart';
import 'package:lek_bierz/ui/common/medicine_item.dart';
import 'package:lek_bierz/ui/medicine/screen.dart';

class ArchiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<LekBierzState, Iterable<Medicine>>(
      converter: (store) => store.state.medicines.where((med) => med.archived),
      builder: (context, medicines) => Scaffold(
          appBar: CommonAppBar(context: context, title: Text('Archiwum')),
          body: ListView(
              children: medicines
                  .map((medicine) => MedicineItem(
                        color: Theme.of(context).primaryColor,
                        title: medicine.productData.name,
                        subtitle:
                            'Zarchiwizowano ${DateTime.fromMillisecondsSinceEpoch(medicine.archivedAt).toString()}',
                        icon: MedicineItem.mapMedicineFormToIcon(
                            medicine.productData.form),
                        onTap: () =>
                            this._medicineItemTapped(context, medicine),
                      ))
                  .toList()
                  .reversed
                  .toList())),
    );
  }

  void _medicineItemTapped(BuildContext context, Medicine medicine) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            MedicineScreen(medicineId: medicine.id)));
  }
}
