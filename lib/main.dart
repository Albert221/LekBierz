import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lek_bierz/ui/home/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const Color primaryColor = Color.fromRGBO(0xE2, 0x3A, 0x3A, 1.0);
  static const Color lightGrayColor = Color.fromRGBO(0xAB, 0xAB, 0xAB, 1.0);
  static const Color grayColor = Color.fromRGBO(0x70, 0x70, 0x70, 1.0);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: primaryColor, // FIXME: Set to white, icons gray
    ));

    return new MaterialApp(
        title: 'LekBierz',
        theme: ThemeData(
          brightness: Brightness.light,
            primaryColor: primaryColor),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
