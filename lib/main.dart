import 'package:flutter/material.dart';

import 'convert.dart';
import 'dropdown.dart';
import 'input.dart';
import 'result.dart';
import 'riwayat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();

  double _inputUser = 0;
  var listItem = ["Kelvin", "Reamur"];
  String _newValue = "Kelvin";
  double _result = 0;
  List<String> listViewItem = [];

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (_newValue == "Kelvin") {
        _result = _inputUser + 273;
      } else {
        _result = (4 / 5) * _inputUser;
      }

      addItemToList();
    });
  }

  void addItemToList() {
    setState(() {
      String value = _newValue + " : " + _result.toStringAsFixed(1);
      listViewItem.insert(0, value);
    });
  }

  void dropdownOnChanged(String? changeValue) {
    setState(() {
      _newValue = changeValue!;
      perhitunganSuhu();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Input(etInput: etInput),
              DropdownKonversi(
                  listItem: listItem,
                  newValue: _newValue,
                  dropdownOnChanged: dropdownOnChanged),
              Result(result: _result),
              Convert(konvertHandler: perhitunganSuhu),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(child: RiwayatKonversi(listViewItem: listViewItem))
            ],
          ),
        ),
      ),
    );
  }
}
