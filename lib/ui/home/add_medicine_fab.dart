import 'package:flutter/material.dart';

class AddMedicineFab extends StatelessWidget {
  final Function() onPress;

  const AddMedicineFab({Key key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add_a_photo),
      onPressed: () {
        if (this.onPress != null)
          this.onPress();
      },
    );
  }
}
