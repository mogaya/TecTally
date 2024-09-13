import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/assetId_controller.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customDetailsInput.dart';
import 'package:tectally_app/views/components/customText.dart';

class AssetIdentity extends StatefulWidget {
  const AssetIdentity({Key? key}) : super(key: key);

  @override
  _AssetIdentityState createState() => _AssetIdentityState();
}

class _AssetIdentityState extends State<AssetIdentity> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _options = [
    'Computer',
    'Mobile',
    'Networking',
    'Peripheral',
    'Storage',
    'Others'
  ];
  final TextEditingController _assetName = TextEditingController();
  final TextEditingController _tagNo = TextEditingController();
  final TextEditingController _serialNo = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final AssetidController assetidController = Get.put(AssetidController());

  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        centerTitle: true,
        title: const customText(
          label: 'Asset Identification',
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
                  // Asset Name input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Asset Name",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _assetName,
                    hintMessage: 'Asset Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Asset Name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Tag No input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Tag No",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  customDetailsInput(
                    controller: _tagNo,
                    hintMessage: 'Tag No',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tag No is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Serial No input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Serial No",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 275,
                        child: customDetailsInput(
                          controller: _serialNo,
                          hintMessage: 'Serial No',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Serial No is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => {}, // Handle tap
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/img/scan.png',
                              height: 35,
                            ),
                            const customText(
                              label: "Scan",
                              fontSize: 16,
                              labelColor: secondaryColor,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Category input area
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        label: "Category",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Select a Category',
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
                          _category.text =
                              newValue ?? ''; // Update text field if needed
                        },
                      );
                    },
                    value: _selectedValue,
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
                          assetIdenty();
                        }
                      },
                      borderRadius: 30,
                      txtFontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const customText(
                    label: "1 / 4",
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

  // asset identity logic
  Future<void> assetIdenty() async {
    http.Response response;
    var body = {
      'ast_name': _assetName.text.trim(),
      'ast_tag': _tagNo.text.trim(),
      'ast_serial': _serialNo.text.trim(),
      'ast_category': _category.text.trim(),
    };

    response = await http.post(
        Uri.parse("https://mmogaya.com/tectally/add_asset/asset_identity.php"),
        body: body);

    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int success = serverResponse['success'];

      if (success == 1) {
        var assetId = serverResponse['ast_id'];
        print(assetId);
        assetidController.updateAssetId(assetId);
        Get.toNamed("/purchase_info");
      }
    }
  }
}
