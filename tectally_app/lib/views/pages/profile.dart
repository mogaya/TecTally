import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customText.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
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
      body: Center(
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
            const customText(
              label: "Mogaya",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
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
                  const customText(
                    label: "0909090909",
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
                  const customText(
                    label: "mogaya@gmail.com",
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
                        onPressed: () {},
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
                          onPressed: () {},
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
                          onPressed: () {},
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
    );
  }
}
