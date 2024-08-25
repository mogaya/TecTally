import 'package:flutter/material.dart';
import 'package:tectally_app/configs/constants.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black, // Default text color
              fontSize: 16.0, // Default text size
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                borderSide: BorderSide(
                  color:
                      secondaryColor, // Change this to your desired focus color
                  width: 2.0, // Increase the width of the border
                ),
              ),
              labelText: 'Asset name / Model',
              labelStyle: TextStyle(
                color: Colors.grey, // Default label color
              ),
              // focusedLabelStyle: TextStyle(
              //   color: secondaryColor, // Change label color when focused
              //   fontWeight: FontWeight.bold, // Change font weight when focused
              //   fontSize: 18.0, // Change font size when focused
              // ),
            ),
            cursorColor: secondaryColor, // Change the cursor color when focused
          ),
        ),
      ),
    );
    ;
  }
}
