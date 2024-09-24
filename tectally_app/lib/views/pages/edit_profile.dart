import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/profile/profile_controller.dart';
import 'package:tectally_app/controllers/signin_controller.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customDetailsInput.dart';
import 'package:tectally_app/views/components/customText.dart';

SigninController signinController = Get.put(SigninController());
ProfileController profileController = Get.put(ProfileController());

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userName = TextEditingController();
  final TextEditingController _userPhone = TextEditingController();
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _userOrganization = TextEditingController();
  // final AssetidController assetidController = Get.put(AssetidController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        centerTitle: true,
        title: const customText(
          label: 'Edit Profile',
          fontSize: 28,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: 650,
              maxWidth: 320,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Username input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Username",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _userName,
                    hintMessage: 'Username',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Phone No. input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Phone No.",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _userPhone,
                    keyboardType: TextInputType.phone,
                    hintMessage: 'Phone No.',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone is required';
                      } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Email input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Email",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _userEmail,
                    hintMessage: 'Email',
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
                  const SizedBox(height: 10),

                  // Organization input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Organization",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _userOrganization,
                    hintMessage: 'Organization',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Organization is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 60),

                  // Save Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customButton(
                        text: "CANCEL",
                        txtFontWeight: FontWeight.bold,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        borderRadius: 30,
                        txtFontSize: 18,
                        color: Colors.green,
                      ),
                      customButton(
                        text: "SAVE",
                        txtFontWeight: FontWeight.bold,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            editProfile();
                          }
                        },
                        borderRadius: 30,
                        txtFontSize: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // API connection To Edit Profile
  Future<void> editProfile() async {
    // Loading
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    http.Response response;
    var body = {
      'userId': '${profileController.userId.value}',
      'userPhone': _userPhone.text.trim(),
      'userEmail': _userEmail.text.trim(),
      'userOrganization': _userOrganization.text.trim(),
      'userName': _userName.text.trim(),
    };

    response = await http.post(
        Uri.parse("https://mmogaya.com/tectally/profile/profile_edit.php"),
        body: body);

    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int success = serverResponse['success'];

      if (success == 1) {
        Navigator.pop(context);
        // styled snackbar to notify the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const customText(
              label: "Profile Updated",
              labelColor: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        );
      }
    }
    Navigator.pop(context);
  }
}
