import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/assetId_controller.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customDetailsInput.dart';
import 'package:tectally_app/views/components/customText.dart';

class LicenceInfo extends StatefulWidget {
  LicenceInfo({super.key});

  @override
  _LicenceInfoState createState() => _LicenceInfoState();
}

class _LicenceInfoState extends State<LicenceInfo> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _licenceName = TextEditingController();
  final TextEditingController _issueDate = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();
  final TextEditingController _licenceNo = TextEditingController();
  AssetidController assetidController = Get.put(AssetidController());

  // Method to display the date picker and update the issue date
  Future<void> _selectIssueDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Header background color
            hintColor: Colors.blue, // Selection color
            colorScheme: const ColorScheme.light(
              primary: Colors.blue, // Header text color
              onPrimary: Colors.white, // Header text on color
              onSurface: Colors.black, // Body text color
            ),
            dialogBackgroundColor:
                Colors.white, // Background color of the dialog
            textTheme: const TextTheme(
              headlineMedium: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold), // Selected date
              bodyMedium: TextStyle(fontSize: 16, color: Colors.grey),
              // Days on the calendar
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                // primary: Colors.blue, // Button text color
                textStyle: const TextStyle(
                  fontSize: 18, // Set your desired font size here
                  fontWeight: FontWeight.bold, // Set your desired font weight
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _issueDate.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  // Method to display the date picker and update the expiry date
  Future<void> _selectExpiryDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Header background color
            hintColor: Colors.blue, // Selection color
            colorScheme: const ColorScheme.light(
              primary: Colors.blue, // Header text color
              onPrimary: Colors.white, // Header text on color
              onSurface: Colors.black, // Body text color
            ),
            dialogBackgroundColor:
                Colors.white, // Background color of the dialog
            textTheme: const TextTheme(
              headlineMedium: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold), // Selected date
              bodyMedium: TextStyle(fontSize: 16, color: Colors.grey),
              // Days on the calendar
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                // primary: Colors.blue, // Button text color
                textStyle: const TextStyle(
                  fontSize: 18, // Set your desired font size here
                  fontWeight: FontWeight.bold, // Set your desired font weight
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _expiryDate.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        shadowColor: baseColor,
        centerTitle: true,
        title: const customText(
          label: 'Licence Information',
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
                  // Licence Name / Type input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Licence Name / Type",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _licenceName,
                    hintMessage: 'Licence Name / Type',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Licence Name / Type is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  // Date of Issue input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Issue Date",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _issueDate,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Select Date',
                      suffixIcon: Icon(Icons.calendar_today),
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
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    onTap: () {
                      _selectIssueDate(context);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Issue Date is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  // Date of Expiry input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Expiry Date",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _expiryDate,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Select Date',
                      suffixIcon: Icon(Icons.calendar_today),
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
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    onTap: () {
                      _selectExpiryDate(context);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Expiry Date is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  // Licence No. input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Licence No",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _licenceNo,
                    hintMessage: 'Licence No',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Licence No is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Save Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      customButton(
                        text: "SKIP",
                        onPressed: () => {},
                        borderRadius: 30,
                        txtFontSize: 18,
                        color: baseColor,
                        txtFontWeight: FontWeight.bold,
                        txtColor: textColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      customButton(
                        text: "SAVE",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            licenceInfo();
                            // Get.toNamed('/assign_info');
                          }
                        },
                        borderRadius: 30,
                        txtFontSize: 18,
                        txtFontWeight: FontWeight.bold,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  const customText(
                    label: "3 / 4",
                    fontWeight: FontWeight.w600,
                    labelColor: secondaryColor,
                    fontSize: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // licence Info logic
  Future<void> licenceInfo() async {
    http.Response response;
    var body = {
      'ast_id': '${assetidController.assetId.value}',
      'ast_licence': _licenceName.text.trim(),
      'ast_licence_date': _issueDate.text.trim(),
      'ast_licence_expiry': _expiryDate.text.trim(),
      'ast_licence_no': _licenceNo.text.trim(),
    };
    print(assetidController.assetId.value);

    response = await http.post(
        Uri.parse("https://mmogaya.com/tectally/add_asset/licence_info.php"),
        body: body);

    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int success = serverResponse['success'];

      if (success == 1) {
        Get.toNamed("/assign_info");
      }
    }
  }
}
