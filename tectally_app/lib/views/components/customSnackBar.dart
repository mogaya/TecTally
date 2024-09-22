import 'package:flutter/material.dart';
import 'package:tectally_app/views/components/customText.dart';

class customSnackBar extends StatelessWidget {
  const customSnackBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: const customText(
        label: "Download Successful: File saved in Downloads",
        labelColor: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      duration: const Duration(seconds: 6),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
