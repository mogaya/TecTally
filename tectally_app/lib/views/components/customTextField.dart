import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/pages/signin.dart';

// ignore: camel_case_types
class customTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintMessage;
  final bool obscureText;
  final bool isPassword;
  final IconData? icon;
  final Color backgroundColor;

  final IconData? prefIcon;
  final Function()? onTap;
  final InputDecoration? decoration;

  const customTextField({
    super.key,
    this.controller,
    this.hintMessage,
    this.obscureText = false,
    this.isPassword = false,
    this.icon,
    this.backgroundColor = baseColor,
    this.prefIcon,
    this.onTap,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool isHidden = signinController.isHidden.value;
        return TextField(
          onTap: onTap,
          obscureText: isPassword && isHidden,
          cursorColor: secondaryColor,
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
                ? GestureDetector(
                    child: Icon(isHidden
                        ? Icons.visibility_off_sharp
                        : Icons.visibility),
                    onTap: () => signinController.toggleHide(),
                  )
                : null,
          ),
        );
      },
    );
  }
}
