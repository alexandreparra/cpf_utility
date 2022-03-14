import 'dart:math';

import 'package:cpf_util/src/extension.dart';
import 'package:cpf_util/src/generator/generator.dart';
import 'package:cpf_util/src/state_number.dart';

/// [States] represents the official 26 state codes of Brazil.
enum States {
  df, go, ms, to,         // 1
  pa, am, ac, ap, ro, rr, // 2
  ce, ma, pi,             // 3
  pe, rn, pb, al,         // 4
  ba, se,                 // 5
  mg,                     // 6
  rj, es,                 // 7
  sp,                     // 8
  pr, sc,                 // 9
  rs                      // 0
}

/// Generate a valid CPF, [formatted] or not, based on the [state] if one is given, if not
/// the State will be randomly generated too.
String generateCpf({States? state, bool formatted = true}) {
  var random = Random();
  var initialNumbers = List.generate(8, (_) => random.nextInt(8)).toList();

  if (state != null) {
    initialNumbers.add(stateNumber(state));
  } else {
    initialNumbers.add(random.nextInt(9));
  }

  var cpf = generate(initialNumbers);

  if (formatted) {
    return formatCpf(cpf);
  }

  return cpf;
}

/// Returns `true` if the given [cpf] is valid.
///
/// CPF's can only have 2 valid formats:
/// - Unformatted 11 digits.
/// - Formatted 14 digits.
bool validateCpf(String cpf) {
  if (cpf.length > 14 || cpf.length < 11) {
    return false;
  }

  var unformattedCpf = cpf.replaceAll(RegExp(r'[.-]'), "");
  var validatedCpf = generate(unformattedCpf.toCpfValidation());

  if (unformattedCpf == validatedCpf) {
    return true;
  }

  return false;
}

/// Formats the standard 11 digits [cpf].
///
/// Example unformatted CPF: 12345678912
/// Formatted output: 123.456.789-12
String formatCpf(String cpf) {
  return "${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}";
}