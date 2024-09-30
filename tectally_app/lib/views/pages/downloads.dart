import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/profile/profile_controller.dart';
import 'package:tectally_app/views/components/customElevatedBtn.dart';
import 'dart:io';
import 'package:tectally_app/views/components/customText.dart';

ProfileController profileController = Get.put(ProfileController());

class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        centerTitle: true,
        title: const customText(
          label: 'Downloads',
          fontFamily: 'OpenSans',
          fontSize: 28,
          fontWeight: FontWeight.bold,
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
              Wrap(
                children: [
                  // Download All Employees File
                  customElevatedBtn(
                    onPressed: () {
                      download('all_employees');
                    },
                    text: "All Employees",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // Download All Assets File
                  customElevatedBtn(
                    onPressed: () {
                      download('all_assets');
                    },
                    text: "All Assets",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              const Text(
                "Employees Section:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Wrap(
                children: [
                  // Download Board File
                  customElevatedBtn(
                    onPressed: () {
                      download('board');
                    },
                    text: "Board",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // Download Public Relations File
                  customElevatedBtn(
                    onPressed: () {
                      download('public_relations');
                    },
                    text: "Public Relations",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // Download ICT File
                  customElevatedBtn(
                    onPressed: () {
                      download('ict');
                    },
                    text: "ICT",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // Download Finance File
                  customElevatedBtn(
                    onPressed: () {
                      download('finance');
                    },
                    text: "Finance",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // Download HR File
                  customElevatedBtn(
                    onPressed: () {
                      download('human_resource');
                    },
                    text: "Human Resource",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // Download Board File
                  customElevatedBtn(
                    onPressed: () {
                      download('procurement');
                    },
                    text: "Procurement",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // 'Download' Board File
                  customElevatedBtn(
                    onPressed: () {
                      download('other_departments');
                    },
                    text: "Other Departments",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),

              // Assets Section
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Assets Section:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Wrap(
                children: [
                  // Download Computer File
                  customElevatedBtn(
                    onPressed: () {
                      download('computers');
                    },
                    text: "Computers",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // Download Printer File
                  customElevatedBtn(
                    onPressed: () {
                      download('printers');
                    },
                    text: "Printers",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // Download Mobile File
                  customElevatedBtn(
                    onPressed: () {
                      download('mobiles');
                    },
                    text: "Mobiles",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // Download Peripheral File
                  customElevatedBtn(
                    onPressed: () {
                      download('peripherals');
                    },
                    text: "Peripherals",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // Download Storage File
                  customElevatedBtn(
                    onPressed: () {
                      download('storage');
                    },
                    text: "Storage",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // Download Networking File
                  customElevatedBtn(
                    onPressed: () {
                      download('networking');
                    },
                    text: "Networking",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // Download Others File
                  customElevatedBtn(
                    onPressed: () {
                      download('other_assets');
                    },
                    text: "Other Assets",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),

                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> download(file_name) async {
    //Loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      // Step 1: Make the HTTP request to download the file
      final response = await http.get(
        Uri.parse(
            'https://mmogaya.com/tectally/downloads/$file_name.php?user_id=${profileController.userId.value}'),
      );

      if (response.statusCode == 200) {
        // Step 2: Get the "Downloads" directory path
        final directory = Directory('/storage/emulated/0/Download');
        final filePath = '${directory.path}/$file_name.csv';

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
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        );
      } else {
        // styled snackbar to notify the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const customText(
              label: "Oops: Failed to download file",
              labelColor: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        );
        print(
            "Error Occurred: Failed to download file (Status Code: ${response.statusCode})");
      }
    } catch (e) {
      print("Error Occurred: $e");
    }

    Navigator.of(context).pop();
  }
}
