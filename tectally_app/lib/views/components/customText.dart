import 'package:flutter/material.dart';
import 'package:tectally_app/configs/constants.dart';

// ignore: camel_case_types
class customText extends StatelessWidget {
  final String label;
  final Color labelColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration txtDecoration;
  final Color txtDecColor;

  const customText({
    super.key,
    required this.label,
    this.labelColor = textColor,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.txtDecoration = TextDecoration.none,
    this.txtDecColor = textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: labelColor,
        decoration: txtDecoration,
        decorationColor: txtDecColor,
      ),
    );
  }
}
