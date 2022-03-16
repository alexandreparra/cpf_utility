import 'package:cpf_utility/cpf_utility.dart';
import 'package:test/test.dart';

void main() {
  group('CPF tests', () {
    var generatedFormattedCpf = Cpf.generate();
    var generatedUnFormattedCpf = Cpf.generate(formatted: false);

    test('Format CPF test', () {
      var formattedCpf = Cpf.format("12345678912");
      expect(formattedCpf, "123.456.789-12");
    });

    test('Strip CPF test', () {
      var unformattedCpf = Cpf.strip("123.456.789-12");
      expect(unformattedCpf, "12345678912");
    });

    test('Generated CPF formatted/unformatted length test', () {
      expect(generatedFormattedCpf.length, 14);
      expect(generatedUnFormattedCpf.length, 11);
    });

    test('Validate valid formatted/unformatted CPF', () {
      expect(Cpf.validate(generatedFormattedCpf), isTrue);
      expect(Cpf.validate(generatedUnFormattedCpf), isTrue);
    });

    test('Validate invalid formatted/unformatted CPF', () {
      expect(Cpf.validate("123.456.789-12"), isFalse);
      expect(Cpf.validate("12345678912"), isFalse);
    });
  });

  group('CPF states test', () {
    test('Generate CPF with sp state code', () {
      var spCpf = Cpf.generate(state: States.sp, formatted: false);
      var spCpfFormatted = Cpf.generate(state: States.sp);

      expect(spCpf[8], "8");
      expect(spCpfFormatted[10], "8");
    });

    test('Generate CPF with state code 2', () {
      var amCpf = Cpf.generate(state: States.am, formatted: false);
      var roCpf = Cpf.generate(state: States.ro, formatted: false);

      expect(amCpf[8], "2");
      expect(roCpf[8], "2");
    });
  });
}
