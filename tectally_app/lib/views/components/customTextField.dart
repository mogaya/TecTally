import 'package:flutter/material.dart';
import 'package:tectally_app/configs/constants.dart';

// ignore: camel_case_types
class customTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintMessage;
  final bool obscureText;
  final bool isPassword;
  final IconData? icon;
  final Color backgroundColor;

  const customTextField({
    super.key,
    this.controller,
    this.hintMessage,
    this.obscureText = false,
    this.isPassword = false,
    this.icon,
    this.backgroundColor = baseColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: secondaryColor,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 2),
          ),
          contentPadding: const EdgeInsets.fromLTRB(15, 16, 15, 16),
          hintText: hintMessage,
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w200,
          ),
          prefixIcon: Icon(icon),
          suffixIcon: isPassword
              ? const Icon(Icons.visibility)
              : const SizedBox(
                  height: 10,
                  width: 10,
                )),
    );
  }
}
