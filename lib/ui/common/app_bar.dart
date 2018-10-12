import 'package:flutter/material.dart';

class CommonAppBar extends AppBar {
  CommonAppBar(
      {Key key,
      @required BuildContext context,
      Widget leading,
      Widget title,
      List<Widget> actions})
      : super(
            key: key,
            leading: leading,
            title: title,
            actions: actions,
            backgroundColor: Colors.white,
            textTheme: Theme.of(context).textTheme.apply(
                displayColor: Theme.of(context).primaryColor,
                bodyColor: Theme.of(context).primaryColor),
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor));
}
