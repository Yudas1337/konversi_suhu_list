import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  final Function konvertHandler;

  const Convert({
    Key? key,
    required this.konvertHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () => konvertHandler(),
        child: const Text('Konversi Suhu'),
      ),
    );
  }
}
