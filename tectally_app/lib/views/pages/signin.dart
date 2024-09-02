import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customText.dart';
import 'package:tectally_app/views/components/customTextField.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: baseColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                customText(
                  label: "Welcome Back",
                  fontFamily: "OpenSans",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),

                SizedBox(
                  height: 20,
                ),

                customText(
                  label:
                      "Please fill in your username and password to login to your account.",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(
                  height: 20,
                ),

                // username input area
                Align(
                  alignment: Alignment.centerLeft,
                  child: customText(
                    label: "Username",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.left,
                  ),
                ),
                customTextField(
                  hintMessage: "Enter your Username",
                ),

                SizedBox(
                  height: 20,
                ),

                // password input area
                Align(
                  alignment: Alignment.centerLeft,
                  child: customText(
                    label: "Password",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.left,
                  ),
                ),
                customTextField(
                  hintMessage: "Enter your Password",
                ),

                SizedBox(
                  height: 10,
                ),

                // forgot password
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      customText(
                        label: "Forgot Password?",
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 80,
                ),

                // signIn button
                SizedBox(
                  width: 350,
                  child: customButton(
                    text: "SIGN IN",
                    onPressed: () => Navigator.pushNamed(context, "/navigator"),
                    txtFontWeight: FontWeight.w600,
                    txtFontSize: 22,
                    color: secondaryColor,
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: () => Get.toNamed("/signup"),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
