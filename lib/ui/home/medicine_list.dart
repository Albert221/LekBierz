import 'package:flutter/material.dart';
import 'package:lek_bierz/models/medicine.dart';
import 'package:lek_bierz/ui/common/list_header.dart';
import 'package:lek_bierz/ui/home/medicine_item.dart';

class MedicineList extends StatefulWidget {
  final List<Medicine> medicines;
  final Function(BuildContext, Medicine) onMedicineTap;

  const MedicineList({Key key, this.medicines = const [], this.onMedicineTap})
      : super(key: key);

  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];
    widgets
      ..add(ListHeader('Do wzięcia'))
      ..addAll(this
          .widget
          .medicines
          .map((Medicine medicine) => MedicineItem(
                medicine: medicine,
                onMedicineTap: () {
                  if (this.widget.onMedicineTap != null) {
                    this.widget.onMedicineTap(context, medicine);
                  }
                },
              ))
          .toList())
      ..add(ListHeader('Wzięte'));

    return Column(children: widgets);
  }
}
