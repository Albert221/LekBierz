import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final AlertType type;
  final String content;
  final EdgeInsets margin;

  const Alert(
      {Key key, @required this.type, @required this.content, this.margin})
      : super(key: key);

  Color _getColor() {
    switch (this.type) {
      case AlertType.warning:
        return Colors.orangeAccent;
        break;
      case AlertType.success:
        return Colors.green;
        break;
      default:
        return null;
    }
  }

  IconData _getIconData() {
    switch (this.type) {
      case AlertType.warning:
        return Icons.warning;
        break;
      case AlertType.success:
        return Icons.check_circle;
        break;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    final iconData = _getIconData();

    return Container(
        margin: this.margin,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(2.0)),
            color: color),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              this.content,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            )
          ],
        ));
  }
}

enum AlertType { warning, success }
