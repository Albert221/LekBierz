import 'package:flutter/material.dart';
import 'package:lek_bierz/models/medicine.dart';
import 'package:lek_bierz/ui/common/alert.dart';
import 'package:lek_bierz/ui/common/chip_list.dart';
import 'package:lek_bierz/ui/common/list_header.dart';
import 'package:intl/intl.dart';

class MedicineScreen extends StatefulWidget {
  final Medicine medicine;

  const MedicineScreen({Key key, this.medicine}) : super(key: key);

  @override
  State createState() => MedicineScreenState();
}

class MedicineScreenState extends State<MedicineScreen> {
  List<Widget> _buildDoseHistorySection(BuildContext context) {
    return [
      ListHeader('Historia przyjęć'),
      Expanded(
          child: ListView.builder(
              itemCount: this.widget.medicine.doseHistory.length,
              itemBuilder: (BuildContext context, int i) {
                final dose = this.widget.medicine.doseHistory[i];

                return ListTile(
                  title: Text(DateFormat('dd-MM-yyyy').format(dose.takenAt)),
                  subtitle: Text(dose.notes),
                  trailing: Text('przyjęto'.toUpperCase()),
                );
              }))
    ];
  }

  @override
  Widget build(BuildContext context) {
    final medicine = this.widget.medicine;

    return Scaffold(
      appBar: AppBar(
        title: Text(medicine.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Alert(
            margin: EdgeInsets.all(16.0),
            type: AlertType.warning,
            content: 'Zapomniałeś wziąć leki!',
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                  'W opakowaniu pozostało 56 z ${medicine.packageQuantity} tabletek.')),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              child: ChipList(
                contents: medicine.activeSubstances,
              )),
          Divider()
        ]..addAll(this._buildDoseHistorySection(context)),
      ),
    );
  }
}
