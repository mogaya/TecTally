import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customText.dart';
import 'package:tectally_app/views/components/inputField.dart';

class LicenceInfo extends StatelessWidget {
  const LicenceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        centerTitle: true,
        title: customText(
          label: 'Licence Information',
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
                // Licence Type | Name input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Licence Type | Name',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Date of Issue input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Date of Issue',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Expiry Date input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Expiry Date',
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                const SizedBox(
                  height: 20,
                ),

                // Licence No. input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Licence No.',
                  ),
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
                      onPressed: () => Get.toNamed('/assign_info'),
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
                  label: "3 / 4",
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
