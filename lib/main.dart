import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:lek_bierz/models/serializers.dart';
import 'package:lek_bierz/api/flutter_storage.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/redux/reducers.dart';
import 'package:lek_bierz/ui/home/screen.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist_encoder/redux_persist_encoder.dart';

void main() async {
  await AndroidAlarmManager.initialize();

  Intl.defaultLocale = 'pl';
  initializeDateFormatting('pl');

  final persistor = Persistor<LekBierzState>(
      storage: FlutterStorage('lek-bierz'),
      decoder: (data) =>
          serializers.deserializeWith(LekBierzState.serializer, data),
      encoder: (data) => json
          .encode(serializers.serializeWith(LekBierzState.serializer, data)));

  final store = Store<LekBierzState>(rootReducer,
      initialState: LekBierzState(),
      middleware: [persistor.createMiddleware(), LoggingMiddleware.printer()]);

  persistor.load(store);

  runApp(MyApp(store: store));

  await AndroidAlarmManager.periodic(const Duration(seconds: 10), 1, lol);
}

void lol() {
  debugPrint('siema: ${DateTime.now()}');
}

class MyApp extends StatelessWidget {
  static const Color primaryColor = Color.fromRGBO(0xE2, 0x3A, 0x3A, 1.0);
  static const Color lightGrayColor = Color.fromRGBO(0xAB, 0xAB, 0xAB, 1.0);
  static const Color grayColor = Color.fromRGBO(0x70, 0x70, 0x70, 1.0);

  final Store<LekBierzState> store;

  const MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: MyApp.primaryColor, // FIXME: Set to white, icons gray
    ));

    return StoreProvider<LekBierzState>(
        store: store,
        child: MaterialApp(
            title: 'LekBierz',
            theme: ThemeData(
                brightness: Brightness.light, primaryColor: MyApp.primaryColor),
            debugShowCheckedModeBanner: false,
            home: HomeScreen()));
  }
}
