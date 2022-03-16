import 'package:cpf_utility/cpf_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cpf/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CPF',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CpfPage(),
    );
  }
}

class CpfPage extends StatefulWidget {
  const CpfPage({Key? key}) : super(key: key);

  @override
  State<CpfPage> createState() => _CpfPageState();
}

class _CpfPageState extends State<CpfPage> {
  final _cpfController = TextEditingController();
  var _cpf = "";
  MaterialColor? _fieldColor;
  Icon? _suffixIcon;

  void cleanTextFiled() {
    setState(() {
      _fieldColor = null;
      _suffixIcon = null;
    });
  }

  void changeTextFieldState() {
    setState(() {
      if (Cpf.validate(_cpfController.text)) {
        _fieldColor = Colors.green;
        _suffixIcon = const Icon(Icons.check, color: Colors.black);
      } else {
        _fieldColor = Colors.red;
        _suffixIcon = const Icon(Icons.error_outline, color: Colors.black);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Flutter CPF")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: _cpfController,
                  onChanged: (String text) {
                    setState(() {
                      _cpf = text;
                    });
                  },
                  decoration: InputDecoration(
                      suffixIcon: _suffixIcon,
                      border: const OutlineInputBorder(),
                      fillColor: _fieldColor,
                      filled: true),
                  textAlign: TextAlign.center,
                  maxLength: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          cleanTextFiled();
                          _cpfController.text = Cpf.generate();
                        });
                      },
                      child: const Text(
                        "Generate",
                        style: Style.buttonText,
                      )),
                  const Padding(padding: EdgeInsets.only(right: 30)),
                  MaterialButton(
                      onPressed: changeTextFieldState,
                      child: const Text(
                        "Validate",
                        style: Style.buttonText,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
