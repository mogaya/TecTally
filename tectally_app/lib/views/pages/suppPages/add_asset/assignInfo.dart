import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/assetId_controller.dart';
import 'package:tectally_app/controllers/asset_categories_controllers/search_emp_controller.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customDetailsInput.dart';
import 'package:tectally_app/views/components/customText.dart';

SearchEmpController searchEmpController = Get.put(SearchEmpController());

class AssignInfo extends StatefulWidget {
  AssignInfo({super.key});

  @override
  _AssignInfoState createState() => _AssignInfoState();
}

class _AssignInfoState extends State<AssignInfo> {
  final _formKey = GlobalKey<FormState>();

  final List<String> _statusOptions = [
    'Working',
    'Faulty',
  ];

  final TextEditingController _dateAssigned = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  AssetidController assetidController = Get.put(AssetidController());

  String? _selectedStatus;

  // Method to display the date picker and update the Date assigned
  Future<void> _selectdateAssigned(BuildContext context) async {
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
        _dateAssigned.text = "${picked.year}-${picked.month}-${picked.day}";
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
          label: 'Assignment Information',
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
                  // Assigned to input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Assigned to",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Obx(
                        () => SizedBox(
                          width: 275,
                          child: customDetailsInput(
                            enabled: false,
                            controller: TextEditingController(
                                text: searchEmpController.selectedEmp.value),
                            hintMessage: 'Assigned to',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Assigned to is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => {
                          Get.toNamed(
                            '/search_emp',
                          )
                        }, // Handle tap
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/img/search.png',
                              height: 35,
                            ),
                            const customText(
                              label: "search",
                              fontSize: 15,
                              labelColor: secondaryColor,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      )
                    ],
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

                  customDetailsInput(
                    enabled: false,
                    controller: TextEditingController(
                        text: searchEmpController.selectedDeparment.value),
                    hintMessage: 'Department',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Department is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Date of Expiry input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Date assigned",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _dateAssigned,
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
                      _selectdateAssigned(context);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Date assigned is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  // Status input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Status",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Status',
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
                    ),
                    items: _statusOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(
                        () {
                          _selectedStatus = newValue;
                          _statusController.text =
                              newValue ?? ''; // Update text field if needed
                        },
                      );
                    },
                    value: _selectedStatus,
                  ),

                  const SizedBox(height: 20),

                  // Save Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: customButton(
                      text: "COMPLETE",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AssignInfo();
                          // Get.toNamed('/assign_info');
                        }
                      },
                      borderRadius: 30,
                      txtFontSize: 18,
                      txtFontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  const customText(
                    label: "4 / 4",
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

  // AssignInfo logic
  Future<void> AssignInfo() async {
    http.Response response;
    var body = {
      'ast_id': '${assetidController.assetId.value}',
      'ast_asignee': searchEmpController.selectedEmp.value,
      'ast_department': searchEmpController.selectedDeparment.value,
      'ast_issue_date': _dateAssigned.text.trim(),
      'ast_status': _statusController.text.trim(),
    };
    print(assetidController.assetId.value);

    response = await http.post(
        Uri.parse("https://mmogaya.com/tectally/add_asset/assign_info.php"),
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
