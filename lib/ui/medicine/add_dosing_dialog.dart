import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:lek_bierz/main.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/ui/medicine/dosing_section.dart';

class AddDosingDialog extends StatefulWidget {
  Dosing initialDosing;

  @override
  State createState() => _AddDosingDialogState();

  AddDosingDialog({Key key, this.initialDosing}) : super(key: key);
}

class _AddDosingDialogState extends State<AddDosingDialog> {
  final times = DoseTime.values.toList();
  var choosenFrequency = DosingFrequency.daily;
  var choosenTimes = <DoseTime>[];

  @override
  void initState() {
    super.initState();

    if (widget.initialDosing != null) {
      choosenFrequency = widget.initialDosing.frequency;
      choosenTimes = widget.initialDosing.times.toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final divider = Container(height: 1.0, color: MyApp.lightGrayColor);

    return AlertDialog(
        title: const Text('Ustaw dawkowanie'),
        contentPadding: const EdgeInsets.only(top: 24.0),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          divider,
          ListTile(
              title: const Text('Częstotliwość'),
              subtitle: Text(choosenFrequency.description),
              leading: Icon(Icons.history),
              onTap: () async {
                final frequency = await showDialog(
                    context: context,
                    builder: (BuildContext context) => _FrequencyDialog());

                if (frequency != null) {
                  setState(() {
                    choosenFrequency = frequency;
                  });
                }
              }),
          divider,
          SizedBox(
              width: 300.0,
              height: 250.0,
              child: ListView(
                  children:
                      times.map((time) => _buildTimeCheckbox(time)).toList())),
          divider
        ]),
        actions: [
          FlatButton(
              child: Text('ANULUJ',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              onPressed: () => Navigator.of(context).pop()),
          FlatButton(
              child: Text(choosenTimes.isEmpty ? 'USUŃ' : 'USTAW',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              onPressed: () => Navigator.of(context)
                  .pop(AddDosingDialogResult(_getResultDosing())))
        ]);
  }

  CheckboxListTile _buildTimeCheckbox(DoseTime time) {
    return CheckboxListTile(
        title: Text(time.description),
        value: choosenTimes.contains(time),
        onChanged: (checked) => setState(() {
              if (checked) {
                choosenTimes.add(time);
              } else {
                choosenTimes.remove(time);
              }
            }),
        activeColor: Theme.of(context).primaryColor);
  }

  Dosing _getResultDosing() => choosenTimes.isEmpty
      ? null
      : Dosing((b) => b
        ..frequency = choosenFrequency
        ..times = BuiltList<DoseTime>.from(choosenTimes).toBuilder());
}

class AddDosingDialogResult {
  final Dosing dosing;

  AddDosingDialogResult(this.dosing);
}

class _FrequencyDialog extends StatelessWidget {
  final frequencies = DosingFrequency.values.toList();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: const Text('Wybierz częstotliwość'),
        children: frequencies
            .map((frequency) => SimpleDialogOption(
                child: Text(frequency.description),
                onPressed: () => Navigator.of(context).pop(frequency)))
            .toList());
  }
}
