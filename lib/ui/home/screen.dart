import 'package:flutter/material.dart';
import 'package:lek_bierz/models/medicine.dart';
import 'package:lek_bierz/ui/home/medicine_list.dart';
import 'package:lek_bierz/ui/home/add_medicine_fab.dart';

class HomeScreen extends StatelessWidget {
  void _showArchive() {
    debugPrint('archive pressed lol');
  }

  void _showMedicine(Medicine medicine) {
    debugPrint('tapped on medicine with ean ' + medicine.ean.toString());
  }

  void _showAddingMedicine() {
    debugPrint('fab tapped');
  }

  @override
  Widget build(BuildContext context) {
    final medicines = [
      Medicine(
          name: 'Izotek 10mg',
          ean: 5909990891740,
          activeSubstances: ['Isotretinoinum'],
          form: MedicineForm.capsules,
          packageQuantity: 60,
          dosage: Dosage(frequency: DosageFrequency.daily))
    ];

    return Scaffold(
      appBar: AppBar(title: Text('LekBierz'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.archive),
          onPressed: () => this._showArchive(),
        )
      ]),
      body: Column(
        children: <Widget>[
          MedicineList(
            medicines: medicines,
            onMedicineTap: (medicine) => this._showMedicine(medicine),
          ),
          FlatButton(
            child: Text('Zobacz archiwum'),
            onPressed: () => this._showArchive(),
          )
        ],
      ),
      floatingActionButton: AddMedicineFab(
        onPress: () => this._showAddingMedicine(),
      ),
    );
  }
}
