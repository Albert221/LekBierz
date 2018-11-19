import 'package:flutter/material.dart';
import 'package:lek_bierz/main.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/ui/common/time.dart';
import 'package:lek_bierz/ui/medicine/dose_history_item.dart';

class DoseDetailsDialog extends StatelessWidget {
  final HistoryDose dose;

  const DoseDetailsDialog({Key key, @required this.dose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: EdgeInsets.only(left: 24.0, top: 12.0, right: 16.0),
      title: Text('Dawka'),
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: DoseHistoryItem(
                title: displayDateAndTime(dose.addedAt),
                type: dose.type == HistoryDoseType.taken
                    ? DoseHistoryType.added
                    : DoseHistoryType.side_effect)),
        dose.sideEffects != null && dose.sideEffects != ''
            ? Container(
                padding: EdgeInsets.only(top: 8.0, right: 24.0, left: 24.0),
                child: Text(
                  dose.sideEffects,
                  style: TextStyle(color: MyApp.grayColor),
                ))
            : SizedBox()
      ],
    );
  }
}
