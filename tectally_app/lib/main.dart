import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tectally_app/utils/routes.dart';
import 'package:tectally_app/views/pages/signin.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: "/signin",
    getPages: Routes.routes,
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/signin",
      getPages: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
