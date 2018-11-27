import 'package:built_collection/built_collection.dart';
import 'package:lek_bierz/redux/actions.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:redux_persist_encoder/redux_persist_encoder.dart';

LekBierzState rootReducer(LekBierzState state, action) {
  if (action is PersistLoadedAction<LekBierzState>) {
    return action.state ?? state;
  } else {
    return state.rebuild((b) =>
        b..medicines = medicinesReducer(state.medicines, action).toBuilder());
  }
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
  } else if (action is ArchiveMedicineAction) {
    return state.rebuild((b) => b
      ..map((med) => med.id == action.medicineId
          ? med.rebuild((b) => b
            ..archived = true
            ..archivedAt = DateTime.now().millisecondsSinceEpoch)
          : med));
  } else if (action is UpdateHistoryDoseAction) {
    return state.rebuild((b) => b
      ..map((med) => med.id == action.medicineId
          ? med.rebuild((b) => b
            ..doseHistory = b.doseHistory
                .build()
                .rebuild((b) => b.map((dose) => dose.id == action.dose.id
                    ? dose.rebuild((b) => b
                      ..addedAt = action.dose.addedAt
                      ..sideEffects = action.dose.sideEffects)
                    : dose))
                .toBuilder())
          : med));
  } else if (action is RemoveHistoryDoseAction) {
    return state.rebuild((b) => b
      ..map((med) => med.id == action.medicineId
          ? med.rebuild((b) => b
            ..doseHistory = b.doseHistory
                .build()
                .rebuild(
                    (b) => b.removeWhere((dose) => dose.id == action.doseId))
                .toBuilder())
          : med));
  } else if (action is SetDosingAction) {
    return state.rebuild((b) => b
      ..map((med) => med.id == action.medicineId
          ? med.rebuild((b) => b
            ..dosing = action.dosing != null ? action.dosing.toBuilder() : null)
          : med));
  } else {
    return state;
  }
}
