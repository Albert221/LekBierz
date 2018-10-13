import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lek_bierz/models/app_model.dart';
import 'package:lek_bierz/ui/home/screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static const Color primaryColor = Color.fromRGBO(0xE2, 0x3A, 0x3A, 1.0);
  static const Color lightGrayColor = Color.fromRGBO(0xAB, 0xAB, 0xAB, 1.0);
  static const Color grayColor = Color.fromRGBO(0x70, 0x70, 0x70, 1.0);

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppModel model;

  @override
  void initState() {
    super.initState();

    model = AppModel();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: MyApp.primaryColor, // FIXME: Set to white, icons gray
    ));

    return ScopedModel<AppModel>(
        model: model,
        child: MaterialApp(
            title: 'LekBierz',
            theme: ThemeData(
                brightness: Brightness.light, primaryColor: MyApp.primaryColor),
            debugShowCheckedModeBanner: false,
            home: HomeScreen()));
  }
}
