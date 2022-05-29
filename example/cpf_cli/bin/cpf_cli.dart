import 'package:cpf_utility/cpf_utility.dart';

void main(List<String> arguments) {
  switch (arguments.length) {
    case 0:
      print(Cpf.generate());
      break;
    case 1:
      if (arguments[0] == "-h" || arguments[0] == "--help") {
        help();
      } else {
        notFound(arguments[0]);
      }

      break;
    case 2:
      if (arguments[0] == "-f" || arguments[0] == "--format") {
        format(arguments[1]);
        break;
      }

      if (arguments[0] == "-v" || arguments[0] == "--validate") {
        validate(arguments[1]);
      } else {
        notFound(arguments[0]);
      }

      break;
    default:
      print("Too many arguments, run cpf_cli -h for more info.");
      break;
  }
}

void validate(String cpf) {
  if (Cpf.validate(cpf)) {
    print("$cpf is valid.");
  } else {
    print("$cpf is not valid.");
  }
}

void format(String cpf) {
  if (cpf.length < 11) {
    print("$cpf is not a valid CPF.");
    return;
  }

  var formattedCpf = Cpf.format(cpf);
  if (formattedCpf == cpf) {
    print(cpf);
    print(formattedCpf);
    print("$cpf is already formatted");
    return;
  }

  print(formattedCpf);
}

void notFound(String arg) {
  print(
      "$arg was not found or have incorrect parameters, please run cpf_cli for more info.");
}

void help() {
  print("""
-h, --help     Prints this message.
  
-f, --format   Format a given CPF.
example: cpf_cli -f 12345678910
example: cpf_cli --format 12345678910
  
-v, --validate Validates a given CPF.
example: cpf_cli -v 12345678910
example: cpf_cli --validate 12345678910""");
}
