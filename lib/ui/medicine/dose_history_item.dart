import 'package:flutter/material.dart';
import 'package:lek_bierz/main.dart';

enum DoseHistoryType { add, added, side_effect, skipped }

class DoseHistoryItem extends StatelessWidget {
  final String title;
  final DoseHistoryType type;
  final Function onTap;

  const DoseHistoryItem(
      {Key key, @required this.title, @required this.type, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;
    if (type == DoseHistoryType.add) {
      icon = Icons.add;
      color = MyApp.grayColor;
    } else if (type == DoseHistoryType.added) {
      icon = Icons.check;
      color = Colors.green.shade500;
    } else if (type == DoseHistoryType.side_effect) {
      icon = Icons.message;
      color = Colors.yellow.shade600;
    } else if (type == DoseHistoryType.skipped) {
      icon = Icons.close;
      color = Colors.red.shade400;
    }

    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: color.withAlpha(64)),
              child: Icon(icon, size: 18.0, color: color),
            ),
            SizedBox(width: 16.0),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16.0,
                  fontStyle: type == DoseHistoryType.skipped
                      ? FontStyle.italic
                      : FontStyle.normal,
                  color:
                      type == DoseHistoryType.skipped ? MyApp.grayColor : null),
            )
          ],
        ),
      ),
      onTap: () => onTap != null ? onTap() : null,
    );
  }
}
