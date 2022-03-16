import '../../cpf_utility.dart';

extension StringToArray on String {
  /// Grabs the first 9 digits of the CPF which are the ones
  /// used to validate it.
  List<int> toCpfValidation() {
    return List.generate(9, (i) => int.parse(this[i])).toList();
  }
}

extension StateNumber on States {
  /// Determine the 9th digit of the CPF based on the given [state].
  int number() {
    switch (this) {
      case States.df:
      case States.go:
      case States.ms:
      case States.to:
        return 1;
      case States.pa:
      case States.am:
      case States.ac:
      case States.ap:
      case States.ro:
      case States.rr:
        return 2;
      case States.ce:
      case States.ma:
      case States.pi:
        return 3;
      case States.pe:
      case States.rn:
      case States.pb:
      case States.al:
        return 4;
      case States.ba:
      case States.se:
        return 5;
      case States.mg:
        return 6;
      case States.rj:
      case States.es:
        return 7;
      case States.sp:
        return 8;
      case States.pr:
      case States.sc:
        return 9;
      case States.rs:
        return 0;
    }
  }
}