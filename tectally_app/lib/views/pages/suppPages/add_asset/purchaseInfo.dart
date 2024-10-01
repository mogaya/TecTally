import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/assetId_controller.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customDetailsInput.dart';
import 'package:tectally_app/views/components/customText.dart';

class PurchaseInfo extends StatefulWidget {
  PurchaseInfo({super.key});

  @override
  _PurchaseInfoState createState() => _PurchaseInfoState();
}

class _PurchaseInfoState extends State<PurchaseInfo> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _purchaseDate = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _supplier = TextEditingController();
  final TextEditingController _warrantyNo = TextEditingController();
  AssetidController assetidController = Get.put(AssetidController());

  // Method to display the date picker and update the text field
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date is shown by default
      firstDate: DateTime(2000), // The earliest date allowed
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
      }, // The latest date allowed
    );

    if (picked != null) {
      setState(() {
        // Formatting the date to a readable format
        _purchaseDate.text = "${picked.year}-${picked.month}-${picked.day}";
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
          label: 'Purchase Information',
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
                  // Date of Purchase input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Purchase Date",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _purchaseDate,
                    readOnly:
                        true, // So the user cannot directly type in the date
                    decoration: const InputDecoration(
                      labelText: 'Select Date',
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
                      suffixIcon:
                          Icon(Icons.calendar_today), // Adds a calendar icon
                    ),
                    onTap: () {
                      // When tapped, show the date picker
                      _selectDate(context);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Date is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Price Ksh input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Price",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _price,
                    hintMessage: 'Price',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Price is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Supplier Name input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Supplier Name",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _supplier,
                    hintMessage: 'Supplier Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Supplier Name is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Warranty No. input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Warranty No",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _warrantyNo,
                    hintMessage: 'Warranty No',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Warranty No is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Save Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customButton(
                        text: "SKIP",
                        onPressed: () => {
                          Get.toNamed("/licence_info"),
                        },
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
                            purchaseInfo();
                            // Get.toNamed('/licence_info');
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
                    label: "2 / 4",
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

  // purchase Info logic
  Future<void> purchaseInfo() async {
    http.Response response;
    var body = {
      'ast_id': '${assetidController.assetId.value}',
      'ast_purchase_date': _purchaseDate.text.trim(),
      'ast_price': _price.text.trim(),
      'ast_supplier': _supplier.text.trim(),
      'ast_warranty': _warrantyNo.text.trim(),
    };
    print(assetidController.assetId.value);

    response = await http.post(
        Uri.parse("https://mmogaya.com/tectally/add_asset/purchase_info.php"),
        body: body);

    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int success = serverResponse['success'];

      if (success == 1) {
        Get.toNamed("/licence_info");
      }
    }
  }
}
