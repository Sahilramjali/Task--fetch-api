import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  const TextWidget({required this.text, required this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size,
          fontWeight: size > 15 ? FontWeight.bold : FontWeight.normal,
          color: color),
    );
  }
}
