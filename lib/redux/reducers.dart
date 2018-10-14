import 'package:built_collection/built_collection.dart';
import 'package:lek_bierz/redux/actions.dart';
import 'package:lek_bierz/redux/state.dart';

LekBierzState rootReducer(LekBierzState state, action) {
  return state.rebuild((b) =>
      b..medicines = medicinesReducer(state.medicines, action).toBuilder());
}

BuiltList<Medicine> medicinesReducer(BuiltList<Medicine> state, action) {
  if (action is AddMedicineAction) {
    return state.rebuild((b) => b..add(action.medicine));
  } else if (action is AddHistoryDoseAction) {
    return state.rebuild((b) => b
      ..map((med) => med.id == action.medicineId
          ? med.rebuild((b) => b
            ..doseHistory = b.doseHistory
                .build()
                .rebuild((b) => b.add(action.dose))
                .toBuilder())
          : med));
  } else {
    return state;
  }
}
