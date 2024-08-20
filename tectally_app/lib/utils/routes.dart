import 'package:get/get.dart';
import 'package:tectally_app/views/pages/home.dart';
import 'package:tectally_app/views/pages/landing.dart';
import 'package:tectally_app/views/pages/nav.dart';
import 'package:tectally_app/views/pages/profile.dart';
import 'package:tectally_app/views/pages/signin.dart';
import 'package:tectally_app/views/pages/signup.dart';
import 'package:tectally_app/views/pages/statistics.dart';
import 'package:tectally_app/views/pages/test.dart';
import 'package:tectally_app/views/pages/wish.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => Landing()),
    GetPage(name: "/signin", page: () => SignIn()),
    GetPage(name: "/signup", page: () => SignUp()),
    GetPage(name: "/navigator", page: () => Nav()),
    GetPage(name: "/home", page: () => Home()),
    GetPage(name: "/statistics", page: () => Statistics()),
    GetPage(name: "/profile", page: () => Profile()),
    GetPage(name: "/wish", page: () => Wish()),

    // Test
    GetPage(name: "/test", page: () => Test()),
  ];
}
