import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/profile/profile_controller.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customDetailsInput.dart';
import 'package:tectally_app/views/components/customText.dart';

ProfileController profileController = Get.put(ProfileController());

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _options = [
    'Board',
    'PR',
    'Finance',
    'Human Resource',
    'ICT',
    'Procurement',
    'Other Departments'
  ];
  final TextEditingController _empName = TextEditingController();
  final TextEditingController _department = TextEditingController();
  final TextEditingController _empRole = TextEditingController();
  final TextEditingController _emEmail = TextEditingController();
  final TextEditingController _empPhone = TextEditingController();

  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        centerTitle: true,
        title: const customText(
          label: 'Add Employee',
          fontSize: 24,
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
                  // Employee Name input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Employee Name",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _empName,
                    hintMessage: 'Employee Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Employee Name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Department input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Department",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Department is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Select a Department',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      errorStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    items: _options.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(
                        () {
                          _selectedValue = newValue;
                          _department.text =
                              newValue ?? ''; // Update text field if needed
                        },
                      );
                    },
                    value: _selectedValue,
                  ),
                  const SizedBox(height: 10),

                  // Job role input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Job role",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _empRole,
                    hintMessage: 'Job role',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Job role is required';
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
                    controller: _emEmail,
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
                  const SizedBox(
                    height: 10,
                  ),

                  // Phone input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Phone",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _empPhone,
                    hintMessage: 'Phone',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone is required';
                      } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Please enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(height: 20),

                  // Save Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: customButton(
                      text: "SAVE",
                      txtFontWeight: FontWeight.bold,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AddUser();
                        }
                      },
                      borderRadius: 30,
                      txtFontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // AddUser logic
  Future<void> AddUser() async {
    http.Response response;
    var body = {
      'emp_name': _empName.text.trim(),
      'emp_dpt': _department.text.trim(),
      'emp_role': _empRole.text.trim(),
      'emp_email': _emEmail.text.trim(),
      'emp_phone': _empPhone.text.trim(),
      'user_id': '${profileController.userId.value}'
    };

    response = await http.post(
        Uri.parse("https://mmogaya.com/tectally/add_emp.php"),
        body: body);

    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int success = serverResponse['success'];

      if (success == 1) {
        Get.toNamed("/navigator");
      }
    }
  }
}
