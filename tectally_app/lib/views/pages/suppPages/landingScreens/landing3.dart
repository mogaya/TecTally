import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customText.dart';

class Landing3 extends StatefulWidget {
  const Landing3({super.key});

  @override
  State<Landing3> createState() => _Landing3State();
}

class _Landing3State extends State<Landing3>
    with SingleTickerProviderStateMixin {
  // Controller
  // late final AnimationController _controller;

  // @override
  // void initState() {
  //   super.initState();

  //   _controller = AnimationController(
  //     duration: Duration(seconds: 10),
  //     vsync: this,
  //   );

  //   // Start the animation when the page lands
  //   _controller.forward();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: baseColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.network(
              'https://lottie.host/7fd13c82-4a73-4e56-a614-0ef4c1ca9063/1zUlNHZ2eX.json',
              // controller: _controller,
              // onLoaded: (composition) {
              //   // Configure the AnimationController with the duration of the Lottie animation
              //   _controller.duration = composition.duration;
              // },
            ),
          ),
          customText(
            label: " Explore your Dashboard",
            fontFamily: "OpenSans",
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "View key metrics, track asset performance, and stay informed with real-time notifications.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
