import 'package:flutter/material.dart';
import 'package:lek_bierz/main.dart';

class ListHeader extends StatelessWidget {
  final String text;

  const ListHeader(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(text.toUpperCase(),
          style: const TextStyle(
              color: MyApp.grayColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w700)),
    );
  }
}
