import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lek_bierz/main.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/ui/archive/screen.dart';
import 'package:lek_bierz/ui/common/app_bar.dart';
import 'package:lek_bierz/ui/common/medicine_item.dart';
import 'package:lek_bierz/ui/home/ean_scanner.dart';
import 'package:lek_bierz/ui/medicine/screen.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EanScanner _eanScanner;
  BuildContext _screenContext;

  bool _doingWork = false;

  _HomeScreenState() {
    _eanScanner = EanScanner(onWorkStarted: () {
      setState(() => _doingWork = true);
    }, onWorkEnded: () {
      setState(() => _doingWork = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          context: context,
          title: Text('LekBierz'),
          actions: [
//            IconButton(
//                icon: Icon(Icons.archive),
//                onPressed: () => this._archiveButtonPressed())
          ],
        ),
        body: Builder(builder: (BuildContext context) {
          _screenContext = context;

          return _buildBody(context);
        }));
  }

  Widget _buildBody(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      ListView(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildAddMedicineButton(context)),
          StoreConnector<LekBierzState, Iterable<Medicine>>(
            converter: (store) =>
                store.state.medicines.where((med) => !med.archived),
            builder: (context, medicines) {
              return Column(
                  children: medicines
                      .map((medicine) => MedicineItem(
                            color: Theme.of(context).primaryColor,
                            title: medicine.productData.name,
                            icon: MedicineItem.mapMedicineFormToIcon(
                                medicine.productData.form),
                            onTap: () => this._medicineItemTapped(medicine),
                          ))
                      .toList()
                      .reversed
                      .toList());
            },
          ),
//        Padding(
//            padding: EdgeInsets.symmetric(horizontal: 16.0),
//            child: _buildArchiveButton(context)),
        ],
      ),
      _doingWork ? CircularProgressIndicator() : SizedBox()
    ]);
  }

  Widget _buildAddMedicineButton(BuildContext context) {
    final line = Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          height: 2.0,
          color: MyApp.lightGrayColor,
        ),
      ),
    );

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            line,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: StoreConnector<LekBierzState, VoidCallback>(
                converter: (store) =>
                    () => this._addMedicineButtonPressed(store),
                builder: (context, addMedicine) {
                  return FlatButton(
                    child: Text('DODAJ LEK'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: addMedicine,
                  );
                },
              ),
            ),
            line
          ],
        ));
  }

  Widget _buildArchiveButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: FlatButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('ARCHIWUM'),
                SizedBox(width: 4.0),
                Icon(Icons.arrow_forward)
              ],
            ),
            onPressed: () => this._archiveButtonPressed(),
          ),
        ));
  }

  void _archiveButtonPressed() {
    Navigator.of(_screenContext).push(
        MaterialPageRoute(builder: (BuildContext context) => ArchiveScreen()));
  }

  void _addMedicineButtonPressed(Store<LekBierzState> store) async {
    final result = await _eanScanner.doStuff(store);

    if (!result) {
      Scaffold.of(_screenContext).showSnackBar(SnackBar(
          content: Text(
              'Nie udało się znaleźć zeskanowanego leku. Spróbuj jeszcze raz.')));
    }
  }

  void _medicineItemTapped(Medicine medicine) {
    Navigator.of(_screenContext).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            MedicineScreen(medicineId: medicine.id)));
  }
}
