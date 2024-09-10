import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customText.dart';

class Landing1 extends StatefulWidget {
  const Landing1({super.key});

  @override
  State<Landing1> createState() => _Landing1State();
}

class _Landing1State extends State<Landing1>
    with SingleTickerProviderStateMixin {
  // Controller
  late final AnimationController _controller;
  bool _isLoading = true;
  // Tracks animation loading

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    // Start the animation when the page lands
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: baseColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Lottie.network(
                  'https://lottie.host/52849630-19cc-447d-90f1-838d10612440/BJlVl4qOCs.json',
                  controller: _controller,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the Lottie animation
                    setState(() {
                      _isLoading = false;
                      // Loading to false
                    });
                    _controller.duration = composition.duration;
                  },
                ),
              ),
              const customText(
                label: "Welcome to TecTally",
                fontFamily: "OpenSans",
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Your journey to efficient IT asset management starts here",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: ascentColor,
                strokeWidth: 5,
              ),
              // Loading Indicator
            )
        ],
      ),
    );
  }
}
