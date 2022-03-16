import 'dart:math';

import 'package:cpf_utility/src/util/extension.dart';

import '../states/states.dart';
import 'cpf_generator.dart';

/// Cpf utility functions namespace
class Cpf {
  /// Generate a valid CPF, [formatted] or not, based on the [state] if one is given, if not
  /// the State will be randomly generated too.
  static String generate({States? state, bool formatted = true}) {
    var random = Random();
    var initialNumbers = List.generate(8, (_) => random.nextInt(8)).toList();

    if (state != null) {
      initialNumbers.add(state.number());
    } else {
      initialNumbers.add(random.nextInt(9));
    }

    var cpf = CpfGenerator.generate(initialNumbers);

    if (formatted) {
      return format(cpf);
    }

    return cpf;
  }

  /// Returns `true` if the given [cpf] is valid.
  ///
  /// CPF's can only have 2 valid formats:
  /// - Unformatted 11 digits.
  /// - Formatted 14 digits.
  static bool validate(String cpf) {
    if (cpf.length > 14 || cpf.length < 11) {
      return false;
    }

    var unformattedCpf = strip(cpf);
    var validatedCpf = CpfGenerator.generate(unformattedCpf.toCpfValidation());

    if (unformattedCpf == validatedCpf) {
      return true;
    }

    return false;
  }

  /// Formats the standard 11 digits [cpf].
  ///
  /// Example unformatted CPF: 12345678912
  /// Formatted output: 123.456.789-12
  static String format(String cpf) {
    return "${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}";
  }

  /// Removes the '.' and '-' from formatted CPF's.
  static String strip(String cpf) {
    return cpf.replaceAll(RegExp(r'[.-]'), "");
  }
}