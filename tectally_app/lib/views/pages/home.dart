// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customText.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    final int _pageCount = 5;

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: baseColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText(
              label: "KARIBU TecTally",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            customText(
              label: " Mogaya",
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),

            // Slider Area
            SizedBox(
              height: 250,
              width: 350,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _pageCount,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          color: Colors.orange[(index + 1) *
                              100], // Different shade of orange for each container
                          child: Center(
                            child: Text(
                              'Item ${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _pageCount,
                    effect: const WormEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.orange,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 16.0,
                    ),
                    onDotClicked: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),
            ),

            // Buttons Area

            const SizedBox(
              height: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add Asset Button

                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: secondaryColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed("/add_asset");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/add_asset.svg",
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'ADD ASSET',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Netflix",
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.0,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),

                // Add User Button
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: secondaryColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed("/add_user");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/add_user.svg",
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'ADD USER',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Netflix",
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.0,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            // Asset Inventory Button
            GestureDetector(
              onTap: () {
                Get.toNamed("/asset_inventory");
              },
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.blue.shade500,
                        secondaryColor,
                        // Colors.blue.shade300,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: const Center(
                  child: Text(
                    'ASSET INVENTORY',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Netflix",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 0.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Asset Inventory Button
            GestureDetector(
              onTap: () {
                Get.toNamed("/all_users");
              },
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.blue.shade500,
                        secondaryColor,
                        // Colors.blue.shade300,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: const Center(
                  child: Text(
                    'ALL USERS',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Netflix",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 0.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class customSearchDelegete extends SearchDelegate {
  List<String> searchTerms = [
    "Tesla Model 3",
    "Tesla Model X",
    "Toyota Camry",
    "Ford Mustang",
    "Honda CR-V",
    "BMW X5 ",
    "Audi A4",
    "Subaru Outback",
    "Porsche 911",
    "Jeep Wrangler",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  IconButton buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  ListView buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var car in searchTerms) {
      if (car.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(car);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  ListView buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var car in searchTerms) {
      if (car.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(car);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
