# CPF Util
A simple package that provides [CPF](https://en.wikipedia.org/wiki/CPF_number) utilities.

A CPF is an 11 digit number which is the Brazilian individual identity number.

Example of a formatted CPF: 321.524.051-37

## Getting started
cpf_util provides 3 functions:
- generateCpf | Generate a valid CPF.
- validateCpf | Validate and concludes if a given CPF is valid.
- formatCpf   | Formats an unformatted CPF to the standard CPF format.

generateCpf has a `state` parameter, which is useful if you want to generate a CPF for a given Brazilian
state, the 9th digit determines which state the CPF belongs to.

## Usage

To generate a valid CPF simply:
```dart
String myCpf = generateCpf();
```

If you want to generate a valid CPF from a given Brazilian state you can use the State enum:
```dart
String myCpf = generateCpf(state: States.sp);
```

The CPF comes formatted by default, you can make it unformatted:
```dart
String myCpf = generateCpf(formatted: false);
```

Or if you have an unformatted CPF and want to format it:
```dart
String myCpf = generateCpf(formatted: false); // 32152405137
String formattedCpf = formatCpf(myCpf);       // 321.524.051-37
```

And you can validate a formatted or unformatted CPF:
```dart
if (validateCpf(myCpf)) {
  print("CPF is valid");
} else {
  print("CPF isn't valid");
}
```
