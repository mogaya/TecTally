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
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: customText(
            label: "Create your Account",
            fontSize: 24,
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
                // customText(
                //   label: "Create your Account",
                //   fontSize: 24,
                //   fontWeight: FontWeight.bold,
                // ),

                // SizedBox(
                //   height: 20,
                // ),

                const customText(
                  label:
                      "Karibu TecTally. Please fill in your details to create your account",
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),

                const SizedBox(
                  height: 20,
                ),

                // username input area
                const Align(
                  alignment: Alignment.centerLeft,
                  child: customText(
                    label: "Username",
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
                    txtFontWeight: FontWeight.w500,
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
                    children: [
                      customText(
                        label: "Already have an account?",
                        labelColor: textColor,
                        txtDecoration: TextDecoration.underline,
                        fontSize: 16,
                      ),
                      customText(
                        label: "SignIn",
                        labelColor: secondaryColor,
                        txtDecoration: TextDecoration.underline,
                        txtDecColor: secondaryColor,
                        fontSize: 16,
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
