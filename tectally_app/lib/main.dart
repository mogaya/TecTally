import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tectally_app/utils/routes.dart';

void main() {
  runApp(GetMaterialApp(
    // initialRoute: "/",
    initialRoute: "/all_users",
    theme: ThemeData(fontFamily: "Outfit"),
    getPages: Routes.routes,
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: "/",
      initialRoute: "/all_users",
      theme: ThemeData(fontFamily: "Outfit"),
      getPages: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
