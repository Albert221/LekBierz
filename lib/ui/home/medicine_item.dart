import 'package:flutter/material.dart';
import 'package:lek_bierz/models/medicine.dart';

class MedicineItem extends StatefulWidget {
  final Medicine medicine;
  final Function() onMedicineTap;

  const MedicineItem({Key key, this.medicine, this.onMedicineTap})
      : super(key: key);

  @override
  _MedicineItemState createState() => _MedicineItemState();
}

class _MedicineItemState extends State<MedicineItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.toll),
      title: Text(widget.medicine.name),
      trailing: widget.medicine.isWarning()
          ? Icon(
              Icons.warning,
              color: Colors.orange,
            )
          : null,
      onTap: () {
        if (this.widget.onMedicineTap != null) {
          this.widget.onMedicineTap();
        }
      }
    );
  }
}
