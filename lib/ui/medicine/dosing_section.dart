import 'package:flutter/material.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/ui/common/list_header.dart';

class DosingSection extends StatelessWidget {
  final Dosing dosing;
  final Function onAddDosingTap;

  DosingSection(this.dosing, {Key key, this.onAddDosingTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            ListHeader('Dawkowanie'),
            dosing != null
                ? Row(
                    children: [
                      Chip(
                          label:
                              Text(_getFrequencyDescription(dosing.frequency))),
                      SizedBox(width: 8.0),
                      Chip(label: Text('Rano')),
                      SizedBox(width: 8.0),
                      Chip(label: Text('Po południu')),
                      SizedBox(width: 8.0),
                      Chip(label: Text('Wieczorem')),
                    ],
                  )
                : FlatButton(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(Icons.add_alert, color: Colors.white, size: 20.0),
                      SizedBox(width: 8.0),
                      Text('USTAW DAWKOWANIE',
                          style: TextStyle(color: Colors.white))
                    ]),
                    color: Theme.of(context).primaryColor,
                    onPressed: () => onAddDosingTap(),
                  ),
          ],
        ));
  }

  String _getFrequencyDescription(DosingFrequency frequency) {
    switch (frequency) {
      case DosingFrequency.daily:
        return 'Codziennie';
      case DosingFrequency.everyTwoDays:
        return 'Co dwa dni';
      case DosingFrequency.everyThreeDays:
        return 'Co trzy dni';
      case DosingFrequency.everyFourDays:
        return 'Co cztery dni';
      case DosingFrequency.everyFiveDays:
        return 'Co pięć dni';
      case DosingFrequency.everyWeek:
        return 'Co tydzień';
    }

    return '';
  }
}
