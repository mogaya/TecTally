import 'package:flutter/material.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customText.dart';
import 'package:tectally_app/views/components/inputField.dart';

class AssignInfo extends StatelessWidget {
  const AssignInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        centerTitle: true,
        title: customText(
          label: 'Assignment Information',
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
                // Assigned to input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Assigned to',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Department input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Department',
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
                SizedBox(
                  width: 5,
                ),

                const SizedBox(
                  height: 20,
                ),

                // Status input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Status',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Save Button
                Align(
                  alignment: Alignment.centerRight,
                  child: customButton(
                    text: "COMPLETE",
                    onPressed: () => {},
                    borderRadius: 30,
                    txtFontSize: 18,
                    txtFontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 40,
                ),

                customText(
                  label: "4 / 4",
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
