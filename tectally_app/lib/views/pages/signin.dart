import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/signin_controller.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customTextFormField.dart';
import 'package:tectally_app/views/components/customText.dart';

TextEditingController phone = TextEditingController();
TextEditingController password = TextEditingController();
SigninController signinController = Get.put(SigninController());

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: baseColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, // Tracks Form State
              child: Column(
                children: [
                  const customText(
                    label: "Welcome Back",
                    fontSize: 28,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const customText(
                    label:
                        "Please fill in your Phone and Password to login to your account.",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Phone input area
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

                  // forgot password
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/'),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        customText(
                          label: "Forgot Password?",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 80,
                  ),

                  // signIn button
                  SizedBox(
                    width: 350,
                    child: customButton(
                      text: "SIGN IN",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          remoteLogin(
                              context); // Proceed with login only if the form is valid
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed("/signup"),
                        child: const Row(
                          children: [
                            customText(
                              label: "Don't have an account?",
                              labelColor: textColor,
                              txtDecoration: TextDecoration.underline,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            customText(
                              label: "SignUp",
                              labelColor: secondaryColor,
                              txtDecoration: TextDecoration.underline,
                              txtDecColor: secondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Login Logic
  Future<void> remoteLogin(BuildContext context) async {
    http.Response response;
    response = await http.get(
      Uri.parse(
          "https://mmogaya.com/tectally/login.php?phone=${phone.text}&password=${password.text}"),
    );
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int loginStatus = serverResponse['success'];
      if (loginStatus == 1) {
        // To Dashboard
        var userData = serverResponse['userdata'];
        var phone = userData[0]['phone'];
        print(phone);
        signinController.updatePhoneNumber(phone);
        Get.toNamed("/navigator");
      } else {
        // Show an alert dialog when the login fails
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Align(
                alignment: Alignment.topCenter,
                child: customText(
                  label: "Login Failed !",
                  labelColor: Colors.red,
                  fontSize: 24,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: const customText(
                label: "Incorrect Phone or Password",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const customText(
                    label: "OK",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
