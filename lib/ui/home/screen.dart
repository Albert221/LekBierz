import 'package:flutter/material.dart';
import 'package:lek_bierz/models/medicine.dart';
import 'package:lek_bierz/ui/home/medicine_list.dart';
import 'package:lek_bierz/ui/home/add_medicine_fab.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medicines = [
      Medicine(
          name: 'Izotek 10mg',
          ean: 5909990891740,
          activeSubstances: ['Isotretinoinum'],
          form: MedicineForm.capsules,
          packageQuantity: 60)
    ];

    return Scaffold(
      appBar: AppBar(title: Text('LekBierz'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.archive),
          onPressed: () {
            debugPrint('tapped on archive!');
          },
        )
      ]),
      body: MedicineList(
        medicines: medicines,
        onMedicineTap: (Medicine medicine) {
          debugPrint('tapped on medicine with ean ' + medicine.ean.toString());
        },
      ),
      floatingActionButton: AddMedicineFab(
        onPress: () {
          debugPrint('FAB tapped!');
        },
      ),
    );
  }
}
