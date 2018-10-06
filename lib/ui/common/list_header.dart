import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  final String text;

  const ListHeader(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.centerLeft,
      child: Text(text.toUpperCase(),
          style: const TextStyle(
              color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.w700)),
    );
  }
}
