import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customText.dart';
import 'package:tectally_app/views/components/customTextField.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: baseColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                const customTextField(
                  hintMessage: "Enter your Username",
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
                const customTextField(
                  hintMessage: "Enter your Phone Number",
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
                const customTextField(
                  hintMessage: "Enter your Password",
                ),

                const SizedBox(
                  height: 20,
                ),

                // password input area
                const Align(
                  alignment: Alignment.centerLeft,
                  child: customText(
                    label: "Confirm Password",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.left,
                  ),
                ),
                const customTextField(
                  hintMessage: "Confirm your Password",
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
                    onPressed: () => Navigator.pushNamed(context, "/landing"),
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
    );
  }
}
