import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/controllers/nav_controller.dart';
import 'package:tectally_app/views/components/customButton.dart';
import 'package:tectally_app/views/components/customText.dart';
import 'package:tectally_app/views/pages/suppPages/landingScreens/landing1.dart';
import 'package:tectally_app/views/pages/suppPages/landingScreens/landing2.dart';
import 'package:tectally_app/views/pages/suppPages/landingScreens/landing3.dart';
import 'package:tectally_app/views/pages/suppPages/landingScreens/landing4.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  // keeps track of the page we are on
  PageController _controller = PageController();

  // check if on the last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: [
              Landing1(),
              Landing2(),
              Landing3(),
              Landing4(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // dot indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: ScrollingDotsEffect(
                    radius: 20,
                    dotHeight: 12,
                    dotWidth: 12,
                    activeDotColor: Colors.black,
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // skip
                    customButton(
                      borderRadius: 40,
                      text: 'SKIP',
                      txtFontWeight: FontWeight.bold,
                      color: Colors.grey.shade300,
                      onPressed: () {
                        _controller.jumpToPage(3);
                      },
                    ),
                    // GestureDetector(
                    //   onTap: () => {
                    //     _controller.jumpToPage(3),
                    //   },
                    //   child: const customText(
                    //     label: "SKIP",
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),

                    const SizedBox(
                      width: 20,
                    ),

                    // next
                    onLastPage
                        ? customButton(
                            borderRadius: 40,
                            text: 'DONE',
                            txtFontWeight: FontWeight.bold,
                            onPressed: () {
                              Get.toNamed('/signin');
                            },
                          )
                        : customButton(
                            borderRadius: 40,
                            text: 'NEXT',
                            txtFontWeight: FontWeight.bold,
                            onPressed: () {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInCirc,
                              );
                            },
                          ),
                  ],
                ),

                SizedBox(
                  height: 35,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
