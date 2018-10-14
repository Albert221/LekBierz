import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lek_bierz/models/app_model.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/redux/reducers.dart';
import 'package:lek_bierz/ui/home/screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging/redux_logging.dart';

void main() {
  Store<LekBierzState> store = Store<LekBierzState>(rootReducer,
      initialState: LekBierzState(), middleware: [LoggingMiddleware.printer()]);

  runApp(MyApp(model: AppModel(), store: store));
}

class MyApp extends StatelessWidget {
  static const Color primaryColor = Color.fromRGBO(0xE2, 0x3A, 0x3A, 1.0);
  static const Color lightGrayColor = Color.fromRGBO(0xAB, 0xAB, 0xAB, 1.0);
  static const Color grayColor = Color.fromRGBO(0x70, 0x70, 0x70, 1.0);

  final AppModel model;
  final Store<LekBierzState> store;

  const MyApp({Key key, this.model, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: MyApp.primaryColor, // FIXME: Set to white, icons gray
    ));

    return StoreProvider<LekBierzState>(
        store: store,
        child: ScopedModel<AppModel>(
            model: model,
            child: MaterialApp(
                title: 'LekBierz',
                theme: ThemeData(
                    brightness: Brightness.light,
                    primaryColor: MyApp.primaryColor),
                debugShowCheckedModeBanner: false,
                home: HomeScreen())));
  }
}
