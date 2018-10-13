import 'package:lek_bierz/models/medicine.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  final _medicines = [
    Medicine(
        id: '6216b157-eafa-44b6-a9bd-5d77b85fa6ef',
        addedAt: DateTime(2018, 10, 13, 17, 1, 44),
        productData: MedicineData(
          name: 'Izotek 10mg',
          ean: '5909990891740',
          activeSubstances: ['Isotretinoinum'],
          form: MedicineForm.pill,
          packageQuantity: 60,
        ),
        dosing: Dosing(
            frequency: DosingFrequency.daily, times: [DoseTime.after_dinner]),
        doseHistory: [
          HistoryDose(
              time: DoseTime.after_dinner,
              addedAt: DateTime(2018, 10, 13, 18, 34, 7))
        ]),
  ];

  List<Medicine> get medicines => _medicines;

  void addMedicine(Medicine medicine) {
    _medicines.add(medicine);

    notifyListeners();
  }
}
