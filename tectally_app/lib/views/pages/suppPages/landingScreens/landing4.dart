import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tectally_app/configs/constants.dart';
import 'package:tectally_app/views/components/customText.dart';

class Landing4 extends StatefulWidget {
  const Landing4({super.key});

  @override
  State<Landing4> createState() => _Landing4State();
}

class _Landing4State extends State<Landing4>
    with SingleTickerProviderStateMixin {
  // Controller
  late final AnimationController _controller;
  bool _isLoading = true;

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
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Lottie.network(
                  'https://lottie.host/b209bc07-c09d-4172-b111-c2dac138ea13/MSz2JVfvd0.json',
                  controller: _controller,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the Lottie animation
                    _controller.duration = composition.duration;
                    setState(() {
                      _isLoading = false;
                    });
                  },
                ),
              ),
              const customText(
                label: "Welcome to Onboard",
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 12,
              ),

              // Asset Inventory Button
              GestureDetector(
                onTap: () {
                  Get.toNamed("/signup");
                },
                child: Container(
                  height: 60,
                  width: 320,
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
                      'CREATE  ACCOUNT',
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
                  Get.toNamed("/signin");
                },
                child: Container(
                  height: 60,
                  width: 320,
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
                      'SIGN IN',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Outfit",
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
          if (_isLoading)
            (Center(
              child: CircularProgressIndicator(
                color: ascentColor,
                strokeWidth: 5,
              ),
            ))
        ],
      ),
    );
  }
}
