import 'package:flutter/material.dart';
import 'package:lek_bierz/ui/home/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'LekBierz',
        theme: ThemeData(primaryColor: Colors.teal),
        home: HomeScreen());
  }
}
