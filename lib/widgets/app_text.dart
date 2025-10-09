import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  double size;
  final Color color;
  final String text;
  AppText({
    super.key,
    this.color = Colors.black54,
    required this.text,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: color, fontSize: size));
  }
}
