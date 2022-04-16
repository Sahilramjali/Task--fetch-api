import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final function;
  const ButtonWidget({required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
        ),
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 26, 113, 137),
      ),
    );
  }
}
