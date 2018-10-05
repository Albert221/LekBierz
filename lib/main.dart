import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:qr_mobile_vision/qr_mobile_vision.dart';
import 'medicine.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text('LekBierz'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.archive),
                onPressed: () {},
              )
            ],
          ),
          body: ItemsList(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add_a_photo),
              tooltip: 'Add medicine EAN code',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                          width: 400.0,
                          height: 300.0,
                          child: QrCamera(
                            formats: [
                              BarcodeFormats.EAN_8,
                              BarcodeFormats.EAN_13
                            ],
                            qrCodeCallback: (code) {
                              debugPrint('scanned: ' + code);
                            },
                          ));
                    });
              }),
        ));
  }
}

class ItemsList extends StatefulWidget {
  @override
  State createState() => ItemsListState();
}

class ItemsListState extends State<ItemsList> {
  List<dynamic> _itemsList = [
    'Forgotten',
    Medicine('Izotek 10mg', 5909990891740, true),
    'Evening',
    Medicine('Rutinoscorbin', 5909990149728),
    Medicine('Rutinoscorbin Plus', 5909990994519),
  ];

  TextStyle _headerStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
  );

  Widget _buildItemsList() {
    return ListView.builder(
        itemCount: _itemsList.length,
        itemBuilder: (context, i) {
          final item = _itemsList[i];
          if (item is String) {
            return ListTile(
              title: Text(
                item.toUpperCase(),
                style: _headerStyle,
              ),
            );
          } else if (item is Medicine) {
            return ListTile(
              leading: const Icon(Icons.toll),
              title: Text(item.name),
              subtitle: Text('EAN: ' + item.ean.toString()),
              trailing: item.tooLate
                  ? const Icon(
                      Icons.warning,
                      color: Colors.orange,
                    )
                  : null,
              onTap: () {
                //
              },
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemsList();
  }
}
