# CPF Utility
A simple package that provides [CPF](https://en.wikipedia.org/wiki/CPF_number) utilities.

A CPF is an 11 digit number which is the Brazilian individual identity number.

Example of a formatted CPF: 321.524.051-37

## Usage

To generate a valid CPF simply:
```dart
String myCpf = Cpf.generate();
```

If you want to generate a valid CPF from a given Brazilian state you can use the State enum:
```dart
String myCpf = Cpf.generate(state: States.sp);
```

The CPF comes formatted by default, you can make it unformatted:
```dart
String myCpf = Cpf.generate(formatted: false);
```

If you have an unformatted CPF and want to format it:
```dart
String myCpf = Cpf.generate(formatted: false); // 32152405137
String formattedCpf = Cpf.format(myCpf);       // 321.524.051-37
```

Or maybe you want to strip your formatted CPF:
```dart
String unformattedCpf = Cpf.strip(formattedCpf); // 32152405137
```

And you can validate a formatted or unformatted CPF:
```dart
if (Cpf.validate(myCpf)) {
  print("CPF is valid");
} else {
  print("CPF isn't valid");
}
```
