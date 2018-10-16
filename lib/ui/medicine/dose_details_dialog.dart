import 'package:flutter/material.dart';
import 'package:lek_bierz/main.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/ui/medicine/dose_history_item.dart';

class DoseDetailsDialog extends StatelessWidget {
  final HistoryDose dose;
  final Function(BuildContext) onEditTapped;
  final Function onDeleteTapped;
  final bool readonly;

  const DoseDetailsDialog(
      {Key key,
      @required this.dose,
      this.onEditTapped,
      this.onDeleteTapped,
      this.readonly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title;
    if (readonly) {
      title = Text('Dawka');
    } else {
      title = Row(
        children: [
          Expanded(
            child: Text('Dawka'),
          ),
          IconButton(
              icon: Icon(Icons.edit, color: MyApp.grayColor),
              onPressed: () => this._onEditTap(context)),
          IconButton(
              icon: Icon(
                Icons.delete,
                color: MyApp.grayColor,
              ),
              onPressed: () => this._onDeleteTap(context))
        ],
      );
    }

    return SimpleDialog(
      titlePadding: EdgeInsets.only(left: 24.0, top: 12.0, right: 16.0),
      title: title,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: DoseHistoryItem(
                title: dose.addedAt.toString(),
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

  void _onEditTap(BuildContext context) async {
    await onEditTapped(context);
  }

  void _onDeleteTap(BuildContext context) {
    Navigator.of(context).pop();
    onDeleteTapped();
  }
}
