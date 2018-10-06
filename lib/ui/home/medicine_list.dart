import 'package:flutter/material.dart';
import 'package:lek_bierz/models/medicine.dart';
import 'package:lek_bierz/ui/common/list_header.dart';
import 'package:lek_bierz/ui/home/medicine_item.dart';

class MedicineList extends StatefulWidget {
  final List<Medicine> medicines;
  final Function(Medicine) onMedicineTap;

  const MedicineList({Key key, this.medicines = const [], this.onMedicineTap})
      : super(key: key);

  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets
      ..add(ListHeader('Do wzięcia'))
      ..addAll(this
          .widget
          .medicines
          .map((Medicine medicine) => MedicineItem(
                medicine: medicine,
                onMedicineTap: () {
                  if (this.widget.onMedicineTap != null) {
                    this.widget.onMedicineTap(medicine);
                  }
                },
              ))
          .toList())
      ..add(ListHeader('Wzięte'))
      ..add(FlatButton(
        child: Text('Zobacz archiwum'),
        onPressed: () {},
      ));

    return Column(children: widgets);
  }
}
