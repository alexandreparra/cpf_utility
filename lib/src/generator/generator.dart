/// The explanation of how the CPF creation works can be found here
/// [Algoritmo do CPF](https://www.geradorcpf.com/algoritmo_do_cpf.htm).
String generate(List<int> cpf) {
  var firstTable = List.generate(9, (i) => i+2).reversed.toList();
  var secondTable = List.generate(10, (i) => i+2).reversed.toList();

  sumColumns(cpf, firstTable);
  sumColumns(cpf, secondTable);

  return cpf.join();
}

void sumColumns(List<int> cpf, List<int> validationTable) {
  var sum = 0;

  for (var i = 0; i < cpf.length; i++) {
    sum += cpf[i] * validationTable[i];
  }

  cpf.add(magicNumber(sum));
}

int magicNumber(int columnSum) {
  var remainder = columnSum % 11;

  if (remainder < 2) {
    return 0;
  } else {
    return 11 - remainder;
  }
}