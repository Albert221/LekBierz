import 'package:flutter/material.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/ui/common/list_header.dart';
import 'package:lek_bierz/ui/common/time.dart';
import 'package:lek_bierz/ui/medicine/dose_history_item.dart';

class DoseDetailsDialog extends StatelessWidget {
  final HistoryDose dose;

  const DoseDetailsDialog({Key key, @required this.dose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    children.add(DoseHistoryItem(
        title: displayDateAndTime(dose.addedAt),
        type: dose.type == HistoryDoseType.taken
            ? DoseHistoryType.added
            : DoseHistoryType.side_effect));

    if (dose.sideEffects != null && dose.sideEffects.isNotEmpty) {
      children.add(Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
          child: Column(children: [
            const ListHeader('Skutki uboczne'),
            Text(dose.sideEffects)
          ])));
    }

    return SimpleDialog(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        children: children);
  }
}
