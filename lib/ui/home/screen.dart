import 'package:flutter/material.dart';
import 'package:lek_bierz/models/medicinal_product.dart' as products;
import 'package:lek_bierz/main.dart';
import 'package:lek_bierz/models/app_model.dart';
import 'package:lek_bierz/models/medicine.dart';
import 'package:lek_bierz/ui/common/app_bar.dart';
import 'package:lek_bierz/ui/common/list_header.dart';
import 'package:lek_bierz/ui/home/medicine_item.dart';
import 'package:lek_bierz/ui/medicine/screen.dart';
import 'package:lek_bierz/ui/scan_dialog/screen.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BuildContext screenContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          context: context,
          title: Text('LekBierz'),
          actions: [
            IconButton(
              icon: Icon(Icons.archive),
              onPressed: () => this._archiveButtonPressed(),
            )
          ],
        ),
        body: Builder(builder: (BuildContext context) {
          screenContext = context;

          return _buildBody(context);
        }));
  }

  Widget _buildBody(BuildContext context) {
    return ScopedModelDescendant<AppModel>(builder: (context, child, model) {
      return ListView(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildAddMedicineButton(context)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ListHeader('Po południu')),
          Column(
              children: model.medicines
                  .map((medicine) => MedicineItem(
                        color: Theme.of(context).primaryColor,
                        title: medicine.productData.name,
                        icon: _mapMedicineFormToIcon(medicine.productData.form),
                        onTap: () => this._medicineItemTapped(medicine),
                      ))
                  .toList()),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ListHeader('Wzięte na dziś (zmockowane)')),
          MedicineItem(
            color: MyApp.grayColor,
            title: 'Izotek 10mg',
            icon: Icons.map,
          ),
          MedicineItem(
            color: MyApp.grayColor,
            title: 'Herbapect',
            icon: Icons.vertical_align_bottom,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildArchiveButton(context)),
        ],
      );
    });
  }

  IconData _mapMedicineFormToIcon(MedicineForm form) {
    switch (form) {
      case MedicineForm.pill:
        return Icons.toll;
      case MedicineForm.tablet:
        return Icons.add_circle;
      case MedicineForm.syrup:
        return Icons.pin_drop;
      default:
        return Icons.warning;
    }
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
                child: ScopedModelDescendant<AppModel>(
                    builder: (context, child, model) {
                  return FlatButton(
                    child: Text('DODAJ LEK'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () => this._addMedicineButtonPressed(model),
                  );
                })),
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
    Scaffold.of(screenContext).showSnackBar(SnackBar(
      content: Text('Naciśnięto archiwum'),
      duration: Duration(milliseconds: 500),
    ));

    // todo
  }

  void _addMedicineButtonPressed(AppModel model) async {
    final products.MedicinalProductResponse response = await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => ScanScreen(), fullscreenDialog: true));

    if (response == null) return;
    model.addMedicine(Medicine.fromMedicinalProduct(response));
  }

  void _medicineItemTapped(Medicine medicine) {
    Navigator.of(screenContext).push(MaterialPageRoute(
        builder: (BuildContext context) => MedicineScreen(medicineId: medicine.id)));
  }
}
