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
    String subtitle = '';
    Dosage dosage = this.widget.medicine.dosage;
    if (dosage != null) {
      if (dosage.amountToTake == 1) {
        subtitle += 'Po 1 tabletce ';
      } else {
        subtitle += 'Po ' + dosage.amountToTake.toString() + ' tabletkach ';
      }

      switch (dosage.frequency) {
        case DosageFrequency.every_three_days:
          subtitle += 'raz na trzy dni.';
          break;
        case DosageFrequency.every_two_days:
          subtitle += 'raz na dwa dni.';
          break;
        case DosageFrequency.daily:
          subtitle += 'raz dziennie.';
          break;
        case DosageFrequency.two_times_a_day:
          subtitle += 'dwa razy dziennie.';
          break;
        case DosageFrequency.three_times_a_day:
          subtitle += 'trzy razy dziennie.';
          break;
        case DosageFrequency.four_times_a_day:
          subtitle += 'cztery razy dziennie.';
          break;
      }
    }

    return ListTile(
        leading: Icon(Icons.toll),
        title: Text(widget.medicine.name),
        subtitle: Text(subtitle),
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
        });
  }
}
