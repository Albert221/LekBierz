class Medicine {
  final String name;
  final int ean;
  final bool tooLate;

  final List<MedicineTakenHistoryItem> history = <MedicineTakenHistoryItem>[];

  Medicine(this.name, this.ean, [this.tooLate = false]);

  void addHistory() {
    history.add(MedicineTakenHistoryItem(DateTime.now()));
  }
}

class MedicineTakenHistoryItem {
  final DateTime takenAt;

  MedicineTakenHistoryItem(this.takenAt);
}