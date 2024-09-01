import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customText.dart';

class Landing2 extends StatefulWidget {
  const Landing2({super.key});

  @override
  State<Landing2> createState() => _Landing2State();
}

class _Landing2State extends State<Landing2>
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
              'https://lottie.host/07f45c10-b6ef-45be-a73c-6858c1d3ad9c/RBM1oNOaGc.json',
              // controller: _controller,
              // onLoaded: (composition) {
              //   // Configure the AnimationController with the duration of the Lottie animation
              //   _controller.duration = composition.duration;
              // },
            ),
          ),
          customText(
            label: "What you Get",
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
              "Whether you're managing a small business or a large enterprise, TechTally helps you stay on top of every asset",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                // fontFamily: 'Outfit',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
