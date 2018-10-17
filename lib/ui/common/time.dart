import 'package:intl/intl.dart';

String displayDateAndTime(int millisecondsSinceEpoch) {
  final time = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  return DateFormat.MMMMd().format(time) + ', ' + DateFormat.jm().format(time);
}

String displayTime(int millisecondsSinceEpoch) {
  final time = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  return DateFormat.jm().format(time);
}

String displayDate(int millisecondsSinceEpoch) {
  final time = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  return DateFormat.MMMMd().format(time);
}