import 'package:flutter/material.dart';
import 'package:lek_bierz/models/medicine.dart';
import 'package:lek_bierz/ui/common/app_bar.dart';
import 'package:lek_bierz/ui/common/list_header.dart';
import 'package:lek_bierz/ui/medicine/dose_history_item.dart';

class MedicineScreen extends StatefulWidget {
  final Medicine medicine;

  const MedicineScreen({Key key, this.medicine}) : super(key: key);

  @override
  State createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  BuildContext screenContext;

  bool dosingPresent = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          context: context,
          title: Text(widget.medicine.name),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => this._editPressed(),
            ),
            IconButton(
              icon: Icon(Icons.archive),
              onPressed: () => this._archivePressed(),
            )
          ],
        ),
        body: Builder(builder: (BuildContext context) {
          screenContext = context;

          return ListView(
            children: _buildBody(context),
          );
        }));
  }

  List<Widget> _buildBody(BuildContext context) {
    return [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildBarcode(context)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: _buildDescription(context),
      ),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildDosing(context)),
      _buildDoseHistory(context)
    ];
  }

  Widget _buildBarcode(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32.0, bottom: 16.0),
      alignment: Alignment.center,
      child: Image(image: AssetImage('assets/barcode_placeholder.png')),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            Text(
              'Jest dostępnych wiele różnych wersji Lorem Ipsum, ale większość zmieniła się pod wpływem dodanego humoru czy przypadkowych słów, które nawet w najmniejszym stopniu nie przypominają istniejących.',
              style: TextStyle(fontSize: 16.0, height: 1.4),
            ),
            SizedBox(
              height: 16.0,
            ),
            Align(
              alignment: Alignment.center,
              child: FlatButton(
                child: Text('WIĘCEJ SZCZEGÓŁÓW'),
                onPressed: () => this._moreDetailsPressed(),
                color: Color.fromRGBO(0xEE, 0xEE, 0xEE, 1.0),
              ),
            )
          ],
        ));
  }

  Widget _buildDosing(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            ListHeader('Dawkowanie'),
            dosingPresent
                ? Row(
                    children: [
                      Chip(
                        label: Text('Codziennie'),
                      ),
                      SizedBox(width: 8.0),
                      Chip(label: Text('Rano')),
                      SizedBox(width: 8.0),
                      Chip(label: Text('Po południu')),
                      SizedBox(width: 8.0),
                      Chip(label: Text('Wieczorem')),
                    ],
                  )
                : FlatButton(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(Icons.add_alert, color: Colors.white, size: 20.0),
                      SizedBox(width: 8.0),
                      Text('USTAW DAWKOWANIE',
                          style: TextStyle(color: Colors.white))
                    ]),
                    color: Theme.of(context).primaryColor,
                    onPressed: () => this._addDosingPressed(),
                  ),
          ],
        ));
  }

  Widget _buildDoseHistory(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(child: ListHeader('Historia dawek')),
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {},
              )
            ],
          ),
        ),
        DoseHistoryItem(
            title: 'Dodaj kolejną dawkę', type: DoseHistoryType.add),
        DoseHistoryItem(title: 'Dziś, 13:04', type: DoseHistoryType.added),
        DoseHistoryItem(title: 'Dziś, 8:37', type: DoseHistoryType.side_effect),
        DoseHistoryItem(
            title: 'Wczoraj wieczorem', type: DoseHistoryType.skipped),
        DoseHistoryItem(title: 'Wczoraj, 16:52', type: DoseHistoryType.added),
      ],
    );
  }

  void _editPressed() {
    // todo
  }

  void _archivePressed() {
    // todo
  }

  void _moreDetailsPressed() {
    // todo

    setState(() => dosingPresent = !dosingPresent);
  }

  void _addDosingPressed() {
    // todo
  }
}
