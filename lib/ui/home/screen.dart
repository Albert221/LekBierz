import 'package:flutter/material.dart';
import 'package:lek_bierz/api/models/medicinal_product.dart';
import 'package:lek_bierz/main.dart';
import 'package:lek_bierz/models/medicine.dart';
import 'package:lek_bierz/ui/common/app_bar.dart';
import 'package:lek_bierz/ui/common/list_header.dart';
import 'package:lek_bierz/ui/home/medicine_item.dart';
import 'package:lek_bierz/ui/medicine/screen.dart';
import 'package:lek_bierz/ui/scan_dialog/screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BuildContext screenContext;

  final _medicines = [
    Medicine(
        name: 'Izotek 10mg',
        ean: '5909990891740',
        activeSubstances: ['Isotretinoinum'],
        form: MedicineForm.capsules,
        packageQuantity: 60,
        dosage: Dosage(frequency: DosageFrequency.daily),
        doseHistory: [
          Dose(
              takenAt: DateTime.now(),
              notes:
                  'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.')
        ])
  ];

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

          return ListView(
            children: _buildBody(context),
          );
        }));
  }

  List<Widget> _buildBody(BuildContext context) {
    return [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildAddMedicineButton(context)),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: ListHeader('Po południu')),
      Column(
          children: _medicines
              .map((medicine) => MedicineItem(
                    color: Theme.of(context).primaryColor,
                    title: medicine.name,
                    icon: Icons.map,
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
    ];
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
                child: FlatButton(
                  child: Text('DODAJ LEK'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () => this._addMedicineButtonPressed(),
                )),
            line
          ],
        ));
  }

  Widget _buildArchiveButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              child: Row(
                children: [
                  Text('ARCHIWUM'),
                  SizedBox(width: 4.0),
                  Icon(Icons.arrow_forward)
                ],
              ),
              onPressed: () => this._archiveButtonPressed(),
            )
          ],
        ));
  }

  void _archiveButtonPressed() {
    Scaffold.of(screenContext).showSnackBar(SnackBar(
      content: Text('Naciśnięto archiwum'),
      duration: Duration(milliseconds: 500),
    ));

    // todo
  }

  void _addMedicineButtonPressed() async {
    final MedicinalProductResponse response = await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => ScanScreen(), fullscreenDialog: true));

    final meds = response.product;

    setState(() {
      _medicines.add(Medicine(
          name: meds.name,
          activeSubstances: meds.activeSubstances,
          ean: response.ean,
          doseHistory: []));
    });
  }

  void _medicineItemTapped(Medicine medicine) {
    Navigator.of(screenContext).push(MaterialPageRoute(
        builder: (BuildContext context) => MedicineScreen(medicine: medicine)));
  }
}
