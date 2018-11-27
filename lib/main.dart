import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lek_bierz/models/serializers.dart';
import 'package:lek_bierz/api/flutter_storage.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/redux/reducers.dart';
import 'package:lek_bierz/ui/home/screen.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist_encoder/redux_persist_encoder.dart';

void main() {
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
}

class MyApp extends StatelessWidget {
  static const Color primaryColor = const Color(0xFFE23A3A);
  static const Color lightGrayColor = const Color(0xFFABABAB);
  static const Color grayColor = const Color(0xFF707070);

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
