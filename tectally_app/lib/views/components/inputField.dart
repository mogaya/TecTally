import 'package:flutter/material.dart';
import 'package:tectally_app/configs/constants.dart';

class imputField extends StatelessWidget {
  final String label;

  const imputField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      cursorColor: textColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            color: secondaryColor,
            width: 2,
          ),
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: textColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
