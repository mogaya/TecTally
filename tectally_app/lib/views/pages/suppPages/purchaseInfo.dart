import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customText.dart';
import 'package:tectally_app/views/components/inputField.dart';

class PurchaseInfo extends StatelessWidget {
  const PurchaseInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Date of Purchase input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Date of Purchase',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Price Ksh input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Price Ksh',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Supplier Name input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Supplier Name',
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                const SizedBox(
                  height: 20,
                ),

                // Warranty No. input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Warranty No.',
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
                      onPressed: () => Get.toNamed('/licence_info'),
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
