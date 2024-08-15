import 'package:flutter/material.dart';
import 'package:tectally_app/configs/constants.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: baseColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Text('Welcome Back')],
        ),
      ),
    );
  }
}
