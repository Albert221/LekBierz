import 'package:flutter/material.dart';
import 'package:lek_bierz/main.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/ui/common/list_header.dart';

class DosingSection extends StatelessWidget {
  final Dosing dosing;
  final Function onAddDosingTap;

  DosingSection(this.dosing, {Key key, this.onAddDosingTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ListHeader('Dawkowanie')),
          dosing != null
              ? SizedBox(
                  height: 48.0,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: _buildChipsRow(dosing)))
              : FlatButton(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.add_alert, color: Colors.white, size: 20.0),
                    SizedBox(width: 8.0),
                    Text('USTAW DAWKOWANIE',
                        style: TextStyle(color: Colors.white))
                  ]),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => onAddDosingTap())
        ]));
  }

  List<Widget> _buildChipsRow(Dosing dosing) {
    return []
      ..add(Padding(
          padding: EdgeInsets.only(left: 16.0, right: 8.0),
          child: Chip(
              label: Text(_getFrequencyDescription(dosing.frequency)),
              backgroundColor: MyApp.lightGrayColor)))
      ..addAll(_buildDoseTimes(dosing.times.toList()));
  }

  List<Widget> _buildDoseTimes(List<DoseTime> doseTimes) {
    return doseTimes
        .map((time) => Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Chip(label: Text(_getTimeDescription(time)))))
        .toList();
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

  String _getTimeDescription(DoseTime time) {
    switch (time) {
      case DoseTime.morning:
        return 'Rano';
      case DoseTime.afterBreakfast:
        return 'Po śniadaniu';
      case DoseTime.beforeNoon:
        return 'Przed południem';
      case DoseTime.noon:
        return 'W południe';
      case DoseTime.afterLunch:
        return 'Po obiedzie';
      case DoseTime.beforeDinner:
        return 'Przed kolacją';
      case DoseTime.afterDinner:
        return 'Po kolacji';
      case DoseTime.beforeSleep:
        return 'Przed snem';
    }

    return '';
  }
}
