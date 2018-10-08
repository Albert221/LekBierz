import 'package:flutter/material.dart';
import 'package:lek_bierz/models/medicine.dart';
import 'package:lek_bierz/ui/home/medicine_list.dart';
import 'package:lek_bierz/ui/home/add_medicine_fab.dart';
import 'package:lek_bierz/ui/medicine/screen.dart';

class HomeScreen extends StatelessWidget {
  final _medicines = [
    Medicine(
        name: 'Izotek 10mg',
        ean: 5909990891740,
        activeSubstances: ['Isotretinoinum'],
        form: MedicineForm.capsules,
        packageQuantity: 60,
        dosage: Dosage(frequency: DosageFrequency.daily),
        doseHistory: [
          Dose(
              takenAt: DateTime.now(),
              notes:
                  'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.')
        ])
  ];

  void _showArchive() {
    debugPrint('archive pressed lol');
  }

  void _showMedicine(BuildContext context, Medicine medicine) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MedicineScreen(medicine: medicine);
    }));
  }

  void _showAddingMedicine(BuildContext context) {
    debugPrint('fab tapped');
  }

  @override
  Widget build(BuildContext context) {
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
            medicines: this._medicines,
            onMedicineTap: (context, medicine) =>
                this._showMedicine(context, medicine),
          ),
          FlatButton(
            child: Text('Zobacz archiwum'),
            onPressed: () => this._showArchive(),
          )
        ],
      ),
      floatingActionButton: AddMedicineFab(
        onPress: (context) => this._showAddingMedicine(context),
      ),
    );
  }
}
