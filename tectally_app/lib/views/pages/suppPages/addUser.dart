import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customText.dart';
import 'package:tectally_app/views/components/inputField.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        centerTitle: true,
        title: customText(
          label: 'Add User',
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
                // Employee Name input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Employee Name',
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

                // Rank input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Rank',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Email input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Email',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Phone input area
                const SizedBox(
                  width: 320,
                  child: imputField(
                    label: 'Phone',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
