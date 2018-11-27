import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lek_bierz/main.dart';
import 'package:lek_bierz/redux/actions.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/ui/common/app_bar.dart';
import 'package:lek_bierz/ui/common/list_header.dart';
import 'package:lek_bierz/ui/common/time.dart';
import 'package:lek_bierz/ui/medicine/add_dose_dialog.dart';
import 'package:lek_bierz/ui/medicine/add_dosing_dialog.dart';
import 'package:lek_bierz/ui/medicine/dose_details_dialog.dart';
import 'package:lek_bierz/ui/medicine/dose_history_item.dart';
import 'package:lek_bierz/ui/medicine/dosing_section.dart';
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
                actions: [
                  vm.medicine.archived
                      ? Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: const Text('ZARCHIWIZOWANE',
                              style: const TextStyle(color: MyApp.grayColor)))
                      : IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => this._editPressed()),
                ]),
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildBarcode(context)),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildDescription(context)),
      vm.medicine.archived
          ? const SizedBox()
          : DosingSection(vm.medicine.dosing,
              onSetDosingTap: () => this._setDosingPressed(context, vm)),
      _buildDoseHistory(context, vm)
    ];
  }

  Widget _buildBarcode(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
        alignment: Alignment.center,
        child: const Image(
            image: const AssetImage('assets/barcode_placeholder.png')));
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            const Text(
                'Jest dostępnych wiele różnych wersji Lorem Ipsum, ale większość '
                'zmieniła się pod wpływem dodanego humoru czy przypadkowych '
                'słów, które nawet w najmniejszym stopniu nie przypominają '
                'istniejących.',
                style: const TextStyle(fontSize: 16.0, height: 1.4)),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.center,
              child: FlatButton(
                  child: const Text('WIĘCEJ SZCZEGÓŁÓW'),
                  onPressed: () => this._moreDetailsPressed(),
                  color: const Color.fromRGBO(0xEE, 0xEE, 0xEE, 1.0)),
            )
          ],
        ));
  }

  Widget _buildDoseHistory(BuildContext context, _ViewModel vm) {
    final doses = vm.medicine.doseHistory
        .map((dose) {
          if (dose.type == HistoryDoseType.skipped) {
            return DoseHistoryItem(
                title: dose.type.toString(), type: DoseHistoryType.skipped);
          }

          return DoseHistoryItem(
            title: displayDateAndTime(dose.addedAt),
            type: dose.type == HistoryDoseType.taken
                ? DoseHistoryType.added
                : DoseHistoryType.side_effect,
            onTap: () => this._dosePressed(context, vm, dose),
            onEditTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddDoseDialog(
                      initialDateTime:
                          DateTime.fromMillisecondsSinceEpoch(dose.addedAt),
                      initialSideEffects: dose.sideEffects,
                    );
                  }).then((result) {
                if (result == null) return;

                vm.updateDose(dose.rebuild((b) => b
                  ..addedAt = result.dateTime.millisecondsSinceEpoch
                  ..sideEffects = result.sideEffects));
              });
            },
            onDeleteTap: () => vm.removeDose(dose),
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
              const Expanded(child: const ListHeader('Historia dawek')),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {},
              )
            ],
          ),
        ),
        vm.medicine.archived
            ? const SizedBox()
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

  void _setDosingPressed(BuildContext context, _ViewModel vm) async {
    AddDosingDialogResult result = await showDialog(
        context: context,
        builder: (BuildContext context) =>
            AddDosingDialog(initialDosing: vm.medicine.dosing));

    if (result != null) {
      vm.setDosing(result.dosing);
    }
  }

  void _addDosePressed(BuildContext context, _ViewModel vm) async {
    AddDoseDialogResult result = await showDialog(
        context: context, builder: (BuildContext context) => AddDoseDialog());

    if (result != null) {
      HistoryDose dose = HistoryDose((b) => b
        ..id = Uuid().v4()
        ..addedAt = result.dateTime.millisecondsSinceEpoch
        ..time = DoseTime.afterLunch
        ..sideEffects = result.sideEffects);

      vm.addDose(dose);
    }
  }

  void _dosePressed(BuildContext context, _ViewModel vm, HistoryDose dose) {
    showDialog(
        context: context,
        builder: (BuildContext context) => DoseDetailsDialog(dose: dose));
  }
}

class _ViewModel {
  final Medicine medicine;
  final Function archiveMedicine;
  final Function(HistoryDose) addDose;
  final Function(HistoryDose) updateDose;
  final Function(HistoryDose) removeDose;
  final Function(Dosing) setDosing;

  const _ViewModel(
      {this.medicine,
      this.archiveMedicine,
      this.addDose,
      this.updateDose,
      this.removeDose,
      this.setDosing});

  factory _ViewModel.from(Store<LekBierzState> store, String id) {
    final medicine = store.state.medicines.firstWhere((med) => med.id == id);
    return _ViewModel(
        medicine: medicine,
        archiveMedicine: () =>
            store.dispatch(ArchiveMedicineAction(medicine.id)),
        addDose: (HistoryDose dose) =>
            store.dispatch(AddHistoryDoseAction(id, dose)),
        updateDose: (HistoryDose dose) =>
            store.dispatch(UpdateHistoryDoseAction(id, dose)),
        removeDose: (HistoryDose dose) =>
            store.dispatch(RemoveHistoryDoseAction(id, dose.id)),
        setDosing: (Dosing dosing) =>
            store.dispatch(SetDosingAction(id, dosing)));
  }
}
