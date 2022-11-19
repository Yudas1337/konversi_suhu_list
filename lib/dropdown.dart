import 'package:flutter/material.dart';

class DropdownKonversi extends StatelessWidget {
  const DropdownKonversi({
    Key? key,
    required this.listItem,
    required String newValue,
    required this.dropdownOnChanged,
  })  : _newValue = newValue,
        super(key: key);

  final List<String> listItem;
  final String _newValue;
  final Function(String?) dropdownOnChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _newValue,
      onChanged: dropdownOnChanged,
    );
  }
}
