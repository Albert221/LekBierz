import 'package:lek_bierz/redux/state.dart';

class AddMedicineAction {
  final Medicine medicine;

  const AddMedicineAction(this.medicine);
}

class AddHistoryDoseAction {
  final String medicineId;
  final HistoryDose dose;

  const AddHistoryDoseAction(this.medicineId, this.dose);
}