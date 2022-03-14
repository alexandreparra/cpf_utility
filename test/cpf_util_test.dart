import 'package:cpf_util/cpf_util.dart';
import 'package:test/test.dart';

void main() {
  group('CPF tests', () {
    var generatedFormattedCpf = generateCpf();
    var generatedUnFormattedCpf = generateCpf(formatted: false);

    test('Format CPF test', () {
      var formattedCpf = formatCpf("12345678912");
      expect(formattedCpf, "123.456.789-12");
    });

    test('Generated CPF formatted/unformatted length test', () {
      expect(generatedFormattedCpf.length, 14);
      expect(generatedUnFormattedCpf.length, 11);
    });

    test('Validate valid formatted/unformatted CPF', () {
      expect(validateCpf(generatedFormattedCpf), isTrue);
      expect(validateCpf(generatedUnFormattedCpf), isTrue);
    });

    test('Validate invalid formatted/unformatted CPF', () {
      expect(validateCpf("123.456.789-12"), isFalse);
      expect(validateCpf("12345678912"), isFalse);
    });
  });

  group('CPF states test', () {
    test('Generate CPF with sp state code', () {
      var spCpf = generateCpf(state: States.sp, formatted: false);
      var spCpfFormatted = generateCpf(state: States.sp);

      expect(spCpf[8], "8");
      expect(spCpfFormatted[10], "8");
    });

    test('Generate CPF with state code 2', () {
      var amCpf = generateCpf(state: States.am, formatted: false);
      var roCpf = generateCpf(state: States.ro, formatted: false);

      expect(amCpf[8], "2");
      expect(roCpf[8], "2");
    });
  });
}
