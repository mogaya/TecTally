import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customText.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                Icons.exit_to_app_rounded,
                size: 32,
                color: Colors.grey,
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: baseColor,
      body: const Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            CircleAvatar(
              radius: 85,
              backgroundColor: ascentColor,
            ),
            SizedBox(
              height: 20,
            ),
            customText(
              label: "Mogaya",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.business_outlined,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                customText(
                  label: "Organization",
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 8, 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.bookmark_border_outlined,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      customText(
                        label: "BookMarked",
                        fontSize: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      customText(
                        label: "WishList",
                        fontSize: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.people_alt_rounded,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      customText(
                        label: "Team",
                        fontSize: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.edit_square,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      customText(
                        label: "Edit Profile",
                        fontSize: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.output_rounded,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      customText(
                        label: "Sign Out",
                        fontSize: 20,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
