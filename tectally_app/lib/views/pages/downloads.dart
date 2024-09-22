import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/views/components/customElevatedBtn.dart';
import 'dart:io';
import 'package:tectally_app/views/components/customText.dart';

class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Downloads",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select download file:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Employees Section:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  // Download Board File
                  customElevatedBtn(
                    onPressed: () {
                      downloadBoard();
                    },
                    text: "Board File",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> downloadBoard() async {
    try {
      // Step 1: Make the HTTP request to download the file
      final response = await http.get(
        Uri.parse("https://mmogaya.com/tectally/asset_categories/download.php"),
      );

      if (response.statusCode == 200) {
        // Step 2: Get the "Downloads" directory path
        final directory = Directory('/storage/emulated/0/Download');
        final filePath = '${directory.path}/downloaded_file.csv';

        // Step 3: Write the file to the "Downloads" directory
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        print("Download Successful: File saved at $filePath");

        // styled snackbar to notify the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
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
          ),
        );
      } else {
        print(
            "Error Occurred: Failed to download file (Status Code: ${response.statusCode})");
      }
    } catch (e) {
      print("Error Occurred: $e");
    }
  }
}
