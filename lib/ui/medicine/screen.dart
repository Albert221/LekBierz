import 'package:flutter/material.dart';
import 'package:lek_bierz/models/app_model.dart';
import 'package:lek_bierz/models/medicine.dart';
import 'package:lek_bierz/ui/common/app_bar.dart';
import 'package:lek_bierz/ui/common/list_header.dart';
import 'package:lek_bierz/ui/medicine/dose_history_item.dart';
import 'package:scoped_model/scoped_model.dart';

class MedicineScreen extends StatefulWidget {
  final String medicineId;

  const MedicineScreen({Key key, this.medicineId}) : super(key: key);

  @override
  State createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  BuildContext screenContext;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(builder: (context, child, model) {
      final medicine =
          model.medicines.firstWhere((med) => med.id == widget.medicineId);

      return Scaffold(
          appBar: CommonAppBar(
            context: context,
            title: Text(medicine.productData.name),
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
    });
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
        child: ScopedModelDescendant(builder: (context, child, AppModel model) {
          final medicine =
              model.medicines.firstWhere((med) => med.id == widget.medicineId);

          return Column(
            children: [
              ListHeader('Dawkowanie'),
              medicine.dosing != null
                  ? Row(
                      children: [
                        Chip(
                            label: Text(
                                _getFrequencyTitle(medicine.dosing.frequency))),
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
          );
        }));
  }

  String _getFrequencyTitle(DosingFrequency frequency) {
    switch (frequency) {
      case DosingFrequency.daily:
        return 'Codziennie';
      case DosingFrequency.every_two_days:
        return 'Co dwa dni';
      case DosingFrequency.every_three_days:
        return 'Co trzy dni';
      case DosingFrequency.every_four_days:
        return 'Co cztery dni';
      case DosingFrequency.every_five_days:
        return 'Co pięć dni';
      case DosingFrequency.every_week:
        return 'Co tydzień';
    }

    return '';
  }

  String _getTimeTitle(DoseTime time) {
    switch (time) {
      case DoseTime.morning:
        return 'Rano';
      case DoseTime.after_breakfast:
        return 'Po śniadaniu';
      case DoseTime.before_noon:
        return 'Przed południem';
      case DoseTime.noon:
        return 'Południe';
      case DoseTime.after_lunch:
        return 'Po obiedzie';
      case DoseTime.before_dinner:
        return 'Przed kolacją';
      case DoseTime.after_dinner:
        return 'Po kolacji';
      case DoseTime.before_sleep:
        return 'Przed snem';
    }

    return '';
  }

  Widget _buildDoseHistory(BuildContext context) {
    return ScopedModelDescendant<AppModel>(builder: (context, child, model) {
      final medicine =
          model.medicines.firstWhere((med) => med.id == widget.medicineId);

      final doses = medicine.doseHistory.map((dose) {
        if (dose.type == HistoryDoseType.skipped) {
          return DoseHistoryItem(
              title: dose.type.toString(), type: DoseHistoryType.skipped);
        }

        return DoseHistoryItem(
            title: dose.addedAt.toIso8601String(),
            type: dose.type == HistoryDoseType.taken
                ? DoseHistoryType.added
                : DoseHistoryType.side_effect);
      }).toList();

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
        ]..addAll(doses),
      );
    });
  }

  void _editPressed() {
    // todo
  }

  void _archivePressed() {
    // todo
  }

  void _moreDetailsPressed() {
    // todo
  }

  void _addDosingPressed() {
    // todo
  }
}
