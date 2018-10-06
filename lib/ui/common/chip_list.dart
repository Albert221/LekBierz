import 'package:flutter/material.dart';

class ChipList extends StatelessWidget {
  final List<String> contents;

  const ChipList({Key key, @required this.contents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: this
          .contents
          .map((content) => Chip(
                label: Text(content),
              ))
          .toList(),
    );
  }
}
