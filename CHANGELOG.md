## 1.0.1
- Added a private constructor to both Cpf and CpfGenerator classes so they cannot be instantiated.
- Updated the pubspec description.

## 1.0.0
- Updated the library name to cpf_utility, as the cpf_util name was already taken by someone else on pub packages.
- As there are major/breaking changes to the API the version is now 1.0.0
- Refactored the current functions to new folders and added them as static members of a class (to work as a namespace).
- Added the strip function.
- Refactored extensions to its own file under src/util.
- The library now exports the Cpf class and States enum.
- Updated the tests to work with the new Cpf class and static methods and added the strip function test.
- Update the flutter_cpf example.

## 0.1.0
- Initial version.
- Added BSD 3-Clause license.
- Added generate, validate and format CPF functionalities.
- Simple flutter example to demonstrate the library usage.
- Full testing for CPF generation, validation and formatting.
- Partial testing for CPF generation by state.