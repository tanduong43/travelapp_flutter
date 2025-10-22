import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  IconData? icon;
  String? text;
  double size;
  bool isIcon;

  AppButtons({
    super.key,
    this.icon,
    this.text,
    required this.size,
    this.isIcon = false,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child:
          isIcon == false
              ? Center(child: Text(text!, style: TextStyle(color: color)))
              : Center(child: Icon(icon, color: color)),
    );
  }
}
