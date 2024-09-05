import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customText.dart';
import 'package:tectally_app/views/components/customTextField.dart';
import 'package:tectally_app/views/components/customTextFormField.dart';

TextEditingController username = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: customText(
            label: "Create your Account",
            fontFamily: 'OpenSans',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: baseColor,
        elevation: 0,
        foregroundColor: baseColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, // Use the form key here
              child: Column(
                children: [
                  const customText(
                    label:
                        "Karibu TecTally. Please fill in your details to create your account",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // username input area
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: customText(
                      label: "Username",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomTextFormField(
                    hintMessage: "Enter your Username",
                    controller: username,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // phone input area
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: customText(
                      label: "Phone",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomTextFormField(
                    hintMessage: "Enter your Phone",
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number is required';
                      } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Email input area
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: customText(
                      label: "Email",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomTextFormField(
                    hintMessage: "Enter your Email",
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }

                      // Regular expression for validating an email address
                      String pattern =
                          r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.-]?[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,})+$';
                      RegExp regex = RegExp(pattern);

                      if (!regex.hasMatch(value)) {
                        return 'Enter a valid email address';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // password input area
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: customText(
                      label: "Password",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomTextFormField(
                    hintMessage: "Enter your Password",
                    controller: password,
                    icon: Icons.lock_outline_rounded,
                    obscureText: true,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // signIn button
                  SizedBox(
                    width: 350,
                    child: customButton(
                      text: "SIGN UP",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed('/signin');
                        }
                      },
                      txtFontWeight: FontWeight.w600,
                      txtFontSize: 18,
                      color: secondaryColor,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: () => Get.toNamed("/signin"),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customText(
                          label: "Already have an account?",
                          labelColor: textColor,
                          txtDecoration: TextDecoration.underline,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        customText(
                          label: "SignIn",
                          labelColor: secondaryColor,
                          txtDecoration: TextDecoration.underline,
                          txtDecColor: secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
