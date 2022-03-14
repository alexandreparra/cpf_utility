extension StringToArray on String {
  /// Grabs the first 9 digits of the CPF which are the ones
  /// used to validate it.
  List<int> toCpfValidation() {
    return List.generate(9, (i) => int.parse(this[i])).toList();
  }
}