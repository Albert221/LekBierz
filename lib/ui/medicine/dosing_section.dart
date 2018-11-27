import 'package:flutter/material.dart';
import 'package:lek_bierz/main.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/ui/common/list_header.dart';

class DosingSection extends StatelessWidget {
  final Dosing dosing;
  final Function onSetDosingTap;

  DosingSection(this.dosing, {Key key, this.onSetDosingTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const ListHeader('Dawkowanie')),
          dosing != null
              ? SizedBox(
                  height: 48.0,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: _buildChipsRow(context, dosing)))
              : FlatButton(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Icon(Icons.add_alert,
                        color: Colors.white, size: 20.0),
                    const SizedBox(width: 8.0),
                    const Text('USTAW DAWKOWANIE',
                        style: const TextStyle(color: Colors.white))
                  ]),
                  color: Theme.of(context).primaryColor,
                  onPressed: onSetDosingTap)
        ]));
  }

  List<Widget> _buildChipsRow(BuildContext context, Dosing dosing) {
    return []
      ..add(Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
          child: Chip(
              label: Text(dosing.frequency.description,
                  style: const TextStyle(color: Colors.white)),
              backgroundColor: Theme.of(context).primaryColor)))
      ..addAll(_buildDoseTimes(dosing.times.toList()))
      ..add(Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ActionChip(
            avatar: CircleAvatar(
                child: const Icon(Icons.edit, size: 16.0, color: Colors.black),
                backgroundColor: Colors.white.withOpacity(0.1)),
            label: const Text('Zmień'),
            backgroundColor: Colors.black12,
            onPressed: onSetDosingTap,
          )));
  }

  List<Widget> _buildDoseTimes(List<DoseTime> doseTimes) {
    return doseTimes
        .map((time) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Chip(label: Text(time.description))))
        .toList();
  }
}
