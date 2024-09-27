import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/profile/profile_controller.dart';
import 'package:tectally_app/views/components/customText.dart';

ProfileController profileController = Get.put(ProfileController());

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const customText(
          label: "User Profile",
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: baseColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => Get.offAndToNamed("/landing"),
              child: const Icon(
                Icons.output_rounded,
                size: 32,
                color: Colors.grey,
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: baseColor,
      body: Obx(
        () => Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const CircleAvatar(
                radius: 85,
                backgroundColor: ascentColor,
              ),
              const SizedBox(
                height: 20,
              ),
              customText(
                label: profileController.userName.value,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.business_outlined,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  customText(
                    label: profileController.userOrganization.value,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const customText(
                      label: "Phone:",
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    customText(
                      label: profileController.userPhone.value,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const customText(
                      label: "Email:",
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    customText(
                      label: profileController.userEmail.value,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      labelColor: Colors.blue,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                              label: "Account Type:",
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            customText(
                              label: "Basic",
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Lottie.network(
                                        'https://lottie.host/1bc378be-d307-4d2a-9cde-1875b410a2b2/k3w6MbcWxv.json',
                                      ),
                                      const Center(
                                          child: customText(
                                        label: "Coming Soon...",
                                        fontFamily: 'OpenSans',
                                        fontSize: 28,
                                        labelColor: Colors.white,
                                      )),
                                    ],
                                  );
                                });
                          },
                          child: Row(
                            children: [
                              const customText(
                                label: 'Get Premium',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                width: 45,
                                child: Lottie.network(
                                  'https://lottie.host/70daf491-7998-438d-8c4c-1467904233e0/2WHgKX04Oy.json',
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/edit_profile');
                            },
                            child: const SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: secondaryColor,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: customText(
                                      label: "Edit",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 160,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.offAndToNamed("/landing");
                            },
                            child: const SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.output_rounded,
                                    color: Colors.red,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: customText(
                                      label: "Sign Out",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // API connection To Get Profile Data
  Future<void> getProfile() async {
    http.Response response;
    response = await http.get(
      Uri.parse(
          "https://mmogaya.com/tectally/profile/profile.php?user_id=${profileController.userId.value}"),
    );
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);

      profileController
          .updateUserPhone(serverResponse['profile']['user_phone']);
      profileController
          .updateUserEmail(serverResponse['profile']['user_email']);
      profileController.updateUserOrganization(
          serverResponse['profile']['user_organization']);
      profileController.updateUserName(serverResponse['profile']['user_name']);
    } else {
      print("Error Ocurred");
    }
  }
}
