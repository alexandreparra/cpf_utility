import '../cpf_util.dart';

/// Determine the 9th digit of the CPF based on the given [state].
int stateNumber(States state) {
  switch (state) {
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