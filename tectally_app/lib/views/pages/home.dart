// ignore_for_file: unused_import

import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customElevatedBtn.dart';
import 'package:tectally_app/views/components/customText.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // final PageController _pageController = PageController();
    // final int _pageCount = 5;

    const List<String> sampleImages = [
      'assets/img/slide1.jpg',
      'assets/img/slide2.jpg',
      'assets/img/slide3.jpg',
      'assets/img/slide4.jpg',
      'assets/img/slide5.jpg',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
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
            FanCarouselImageSlider.sliderType1(
              imagesLink: sampleImages,
              isAssets: true,
              autoPlay: false,
              sliderHeight: 350,
              sliderWidth: 700,
              showIndicator: true,
              indicatorActiveColor: textColor,
              initalPageIndex: 2,
              isClickable: false,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: customText(
                  label: "Quick Access",
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),

            // Buttons Area

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Add Asset Button

                  Container(
                    height: 85,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed("/add_asset");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/img/computer.png',
                              width: 35,
                              height: 35,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Add asset',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 0.0,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Add User Button
                  Container(
                    height: 85,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed("/add_user");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/img/user.png',
                              width: 35,
                              height: 35,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Add user',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 0.0,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Search Button

                  Container(
                    height: 85,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          // Get.toNamed("/search");
                          showDialog(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Search Board Members
                                      Wrap(
                                        children: [
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/board');
                                            },
                                            text: "Board",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),

                                          // Search pr Members
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/pr');
                                            },
                                            text: "Public Relations ",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),

                                          // Search ict Members
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/ict');
                                            },
                                            text: "ICT",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),

                                          // Search finance Members
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/finance');
                                            },
                                            text: "Finance",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),

                                          // Search Human Resource
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/hr');
                                            },
                                            text: "Human Resource",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),

                                          // Search procurement Members
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/procurement');
                                            },
                                            text: "Procurement",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),

                                          // Search OtherDepartments Members
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/other_departments');
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

                                      const SizedBox(
                                        height: 50,
                                      ),

                                      // Assets Section
                                      Wrap(
                                        children: [
                                          // Search Computers
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/computers');
                                            },
                                            text: "Computers",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),

                                          // Search Networking Members
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/networking');
                                            },
                                            text: "Networking",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),

                                          // Search Board Members
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/printers');
                                            },
                                            text: "Printers",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),

                                          // Search Storage Members
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/storage');
                                            },
                                            text: "Storage",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),

                                          // Search Mobile
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/mobile');
                                            },
                                            text: "Mobiles",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),

                                          // Search Peripherals Members
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/peripherals');
                                            },
                                            text: "Peripherals",
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          const SizedBox(
                                            width: 10,
                                          ),

                                          // Search Printers Members
                                          customElevatedBtn(
                                            onPressed: () {
                                              Get.toNamed('/others');
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
                              );
                            },
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/img/search.png',
                              width: 35,
                              height: 35,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Search',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 0.0,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Scan Button

                  Container(
                    height: 85,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed("/barcode_scanner");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/img/scan.png',
                              width: 35,
                              height: 35,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Scan',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
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
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 0.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 60,
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
