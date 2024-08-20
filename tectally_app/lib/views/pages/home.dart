import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: customSearchDelegete(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(
                  label: "KARIBU TecTally",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                customText(
                  label: " Mogaya",
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
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
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          color: Colors.orange[(index + 1) *
                              100], // Different shade of orange for each container
                          child: Center(
                            child: Text(
                              'Item ${index + 1}',
                              style: TextStyle(
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
                  SizedBox(
                    height: 20,
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _pageCount,
                    effect: WormEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.orange,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 16.0,
                    ),
                    onDotClicked: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
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
                MaterialButton(
                  onPressed: () => Get.toNamed("/add_asset"),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: secondaryColor,
                    ),
                    // color: secondaryColor,
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.computer,
                          ),
                          Text(
                            "Add Asset",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Add User Button
                MaterialButton(
                  onPressed: () => Get.toNamed("/add_user"),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: secondaryColor,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.person_add_alt_1),
                          Text(
                            "Add User",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            // Asset Inventory Button
            MaterialButton(
              onPressed: () => Get.toNamed("/asset_inventory"),
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: secondaryColor,
                ),
                child: Center(
                  child: Text(
                    "ASSET INVENTORY",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // Asset Inventory Button
            MaterialButton(
              onPressed: () => Get.toNamed("/all_users"),
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: secondaryColor,
                ),
                child: Center(
                  child: Text(
                    "ALL USERS",
                    style: TextStyle(
                      fontSize: 20,
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
