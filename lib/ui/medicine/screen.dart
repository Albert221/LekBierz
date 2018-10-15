import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lek_bierz/main.dart';
import 'package:lek_bierz/redux/actions.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/ui/common/app_bar.dart';
import 'package:lek_bierz/ui/common/list_header.dart';
import 'package:lek_bierz/ui/medicine/add_dose_dialog.dart';
import 'package:lek_bierz/ui/medicine/dose_details_dialog.dart';
import 'package:lek_bierz/ui/medicine/dose_history_item.dart';
import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';

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
    return StoreConnector<LekBierzState, _ViewModel>(
      converter: (store) => _ViewModel.from(store, widget.medicineId),
      builder: (context, vm) {
        return Scaffold(
            appBar: CommonAppBar(
              context: context,
              title: Text(vm.medicine.productData.name),
              actions: vm.medicine.archived
                  ? [
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('ZARCHIWIZOWANE',
                              style: TextStyle(color: MyApp.grayColor)))
                    ]
                  : [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => this._editPressed(),
                      ),
                      IconButton(
                        icon: Icon(Icons.archive),
                        onPressed: () => vm.archiveMedicine(),
                      )
                    ],
            ),
            body: Builder(builder: (BuildContext context) {
              screenContext = context;

              return ListView(
                children: _buildBody(context, vm),
              );
            }));
      },
    );
  }

  List<Widget> _buildBody(BuildContext context, _ViewModel vm) {
    return [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildBarcode(context)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: _buildDescription(context),
      ),
      vm.medicine.archived
          ? SizedBox()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildDosing(context, vm)),
      _buildDoseHistory(context, vm)
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

  Widget _buildDosing(BuildContext context, _ViewModel vm) {
    return Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            ListHeader('Dawkowanie'),
            vm.medicine.dosing != null
                ? Row(
                    children: [
                      Chip(
                          label: Text(_getFrequencyTitle(
                              vm.medicine.dosing.frequency))),
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

  String _getFrequencyTitle(DosingFrequency frequency) {
    switch (frequency) {
      case DosingFrequency.daily:
        return 'Codziennie';
      case DosingFrequency.everyTwoDays:
        return 'Co dwa dni';
      case DosingFrequency.everyThreeDays:
        return 'Co trzy dni';
      case DosingFrequency.everyFourDays:
        return 'Co cztery dni';
      case DosingFrequency.everyFiveDays:
        return 'Co pięć dni';
      case DosingFrequency.everyWeek:
        return 'Co tydzień';
    }

    return '';
  }

  String _getTimeTitle(DoseTime time) {
    switch (time) {
      case DoseTime.morning:
        return 'Rano';
      case DoseTime.afterBreakfast:
        return 'Po śniadaniu';
      case DoseTime.beforeNoon:
        return 'Przed południem';
      case DoseTime.noon:
        return 'Południe';
      case DoseTime.afterLunch:
        return 'Po obiedzie';
      case DoseTime.beforeDinner:
        return 'Przed kolacją';
      case DoseTime.afterDinner:
        return 'Po kolacji';
      case DoseTime.beforeSleep:
        return 'Przed snem';
    }

    return '';
  }

  Widget _buildDoseHistory(BuildContext context, _ViewModel vm) {
    final doses = vm.medicine.doseHistory
        .map((dose) {
          if (dose.type == HistoryDoseType.skipped) {
            return DoseHistoryItem(
                title: dose.type.toString(), type: DoseHistoryType.skipped);
          }

          return DoseHistoryItem(
            title: dose.addedAt.toString(),
            type: dose.type == HistoryDoseType.taken
                ? DoseHistoryType.added
                : DoseHistoryType.side_effect,
            onTap: () => this._dosePressed(context, vm, dose),
          );
        })
        .toList()
        .reversed
        .toList();

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
        vm.medicine.archived
            ? SizedBox()
            : DoseHistoryItem(
                title: doses.length > 0
                    ? 'Dodaj kolejną dawkę'
                    : 'Dodaj pierwszą dawkę',
                type: DoseHistoryType.add,
                onTap: () => this._addDosePressed(context, vm),
              ),
      ]..addAll(doses),
    );
  }

  void _editPressed() {
    // todo
  }

  void _moreDetailsPressed() {
    // todo
  }

  void _addDosingPressed() {
    // todo
  }

  void _addDosePressed(BuildContext context, _ViewModel vm) async {
    AddDoseDialogResult result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddDoseDialog();
        });

    if (result != null) {
      HistoryDose dose = HistoryDose((b) => b
        ..id = Uuid().v4()
        ..addedAt = result.dateTime
        ..time = DoseTime.afterLunch
        ..sideEffects = result.sideEffects);

      vm.addDose(dose);
    }
  }

  void _dosePressed(BuildContext context, _ViewModel vm, HistoryDose dose) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DoseDetailsDialog(
            dose: dose,
            onEditTapped: (BuildContext context) async {
              AddDoseDialogResult result = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddDoseDialog(
                      initialDateTime: dose.addedAt,
                      initialSideEffects: dose.sideEffects,
                    );
                  });

              if (result != null) {
                vm.updateDose(dose.rebuild((b) => b
                  ..addedAt = result.dateTime
                  ..sideEffects = result.sideEffects));

                Navigator.of(context).pop();
              }
            },
            onDeleteTapped: () => vm.removeDose(dose),
          );
        });
  }
}

class _ViewModel {
  final Medicine medicine;
  final Function archiveMedicine;
  final Function(HistoryDose) addDose;
  final Function(HistoryDose) updateDose;
  final Function(HistoryDose) removeDose;

  const _ViewModel(
      {this.medicine,
      this.archiveMedicine,
      this.addDose,
      this.updateDose,
      this.removeDose});

  factory _ViewModel.from(Store<LekBierzState> store, String id) {
    final medicine = store.state.medicines.firstWhere((med) => med.id == id);
    return _ViewModel(
        medicine: medicine,
        archiveMedicine: () {
          store.dispatch(ArchiveMedicineAction(medicine.id));
        },
        addDose: (HistoryDose dose) {
          store.dispatch(AddHistoryDoseAction(id, dose));
        },
        updateDose: (HistoryDose dose) {
          store.dispatch(UpdateHistoryDoseAction(id, dose));
        },
        removeDose: (HistoryDose dose) {
          store.dispatch(RemoveHistoryDoseAction(id, dose.id));
        });
  }
}
