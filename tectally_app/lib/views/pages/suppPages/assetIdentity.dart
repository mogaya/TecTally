import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/nav_controller.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customText.dart';
import 'package:tectally_app/views/components/inputField.dart';

class AssetIdentity extends StatelessWidget {
  const AssetIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        centerTitle: true,
        title: customText(
          label: 'Asset Identification',
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Asset Model input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Asset name / Model',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Tag No. input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Tag No.',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Serial No. input area
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 275,
                      child: imputField(
                        label: 'Serial No.',
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Column(
                        children: [
                          Icon(
                            Icons.qr_code_scanner,
                            size: 35,
                          ),
                          customText(
                            label: "SCAN",
                            labelColor: secondaryColor,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                // Category input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Category',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Save Button
                Align(
                  alignment: Alignment.centerRight,
                  child: customButton(
                    text: "SAVE",
                    onPressed: () => Get.toNamed('/purchase_info'),
                    borderRadius: 30,
                    txtFontSize: 18,
                  ),
                ),

                SizedBox(
                  height: 40,
                ),

                customText(
                  label: "1 / 4",
                  fontWeight: FontWeight.w300,
                  labelColor: secondaryColor,
                  fontSize: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
