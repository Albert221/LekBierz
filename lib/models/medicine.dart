class Medicine {
  final String name;
  final int ean;
  final MedicineForm form;
  final List<String> activeSubstances;
  final int packageQuantity;

  const Medicine(
      {this.name,
      this.ean,
      this.form,
      this.activeSubstances,
      this.packageQuantity});

  bool isWarning() => true;
}

enum MedicineForm {
  capsules, // elastyczne kapsułki
  film_coated_tablets, // tabletki powlekane
  herbs, // zioła do zaparzania
  prolonged_release_tablets, // tabletki o przedłużonym uwalnianiu
  dialisys_solution, // roztwór do dializy otrzewnowej
  syrup, // syrop
  // more to come...
}
