import 'package:flutter/material.dart';
import 'package:lek_bierz/ui/home/screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Flutter Demo', home: HomeScreen());
  }
}