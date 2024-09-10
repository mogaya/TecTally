import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tectally_app/configs/constants.dart';
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

  TextEditingController _dateController = TextEditingController();

  // Method to display the date picker and update the text field
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date is shown by default
      firstDate: DateTime(2000), // The earliest date allowed
      lastDate: DateTime(2101), // The latest date allowed
    );

    if (picked != null) {
      setState(() {
        // Formatting the date to a readable format
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
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
        title: customText(
          label: 'Purchase Information',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
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
                    controller: _dateController,
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
                      SizedBox(
                        width: 10,
                      ),
                      customButton(
                        text: "SAVE",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Get.toNamed('/licence_info');
                          }
                        },
                        borderRadius: 30,
                        txtFontSize: 18,
                        txtFontWeight: FontWeight.bold,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  customText(
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
}
