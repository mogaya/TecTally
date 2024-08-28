import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/nav_controller.dart';
import 'package:tectally_app/views/pages/home.dart';
import 'package:tectally_app/views/pages/profile.dart';
import 'package:tectally_app/views/pages/statistics.dart';
import 'package:tectally_app/views/pages/bookmark.dart';
import 'package:tectally_app/views/pages/test.dart';

NavController navController = Get.put(NavController());

var screenList = [
  Home(),
  Statistics(),
  // Test(),
  Bookmark(),
  // Wish(),
  Profile(),
];

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue.shade400,
        backgroundColor: baseColor,
        buttonBackgroundColor: Colors.blue.shade400,
        height: 55,
        items: [
          Icon(
            Icons.home_rounded,
            size: 25,
            color: baseColor,
          ),
          Icon(
            Icons.query_stats_outlined,
            size: 27,
            color: baseColor,
          ),
          Icon(
            Icons.bookmark_border_outlined,
            size: 25,
            color: baseColor,
          ),
          Icon(
            Icons.person,
            size: 25,
            color: baseColor,
          ),
        ],
        onTap: (index) {
          navController.setSelectedPage(index);
        },
      ),
      body: Obx(() => screenList[navController.selectedPage.value]),
    );
  }
}
