import 'package:get/get.dart';
import 'package:tectally_app/views/pages/home.dart';
import 'package:tectally_app/views/pages/landing.dart';
import 'package:tectally_app/views/pages/nav.dart';
import 'package:tectally_app/views/pages/profile.dart';
import 'package:tectally_app/views/pages/signin.dart';
import 'package:tectally_app/views/pages/signup.dart';
import 'package:tectally_app/views/pages/statistics.dart';
import 'package:tectally_app/views/pages/bookmark.dart';
import 'package:tectally_app/views/pages/suppPages/addUser.dart';
import 'package:tectally_app/views/pages/suppPages/allUsers.dart';
import 'package:tectally_app/views/pages/suppPages/assetIdentity.dart';
import 'package:tectally_app/views/pages/suppPages/assignInfo.dart';
import 'package:tectally_app/views/pages/suppPages/licenceInfo.dart';
import 'package:tectally_app/views/pages/suppPages/purchaseInfo.dart';
import 'package:tectally_app/views/pages/test.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => Landing()),
    GetPage(name: "/signin", page: () => SignIn()),
    GetPage(name: "/signup", page: () => SignUp()),
    GetPage(name: "/navigator", page: () => Nav()),
    GetPage(name: "/home", page: () => Home()),
    GetPage(name: "/statistics", page: () => Statistics()),
    GetPage(name: "/profile", page: () => Profile()),
    GetPage(name: "/bookmarks", page: () => Bookmark()),

    // Test
    GetPage(name: "/test", page: () => Test()),

    // supplimentary Pages
    GetPage(name: "/add_asset", page: () => AssetIdentity()),
    GetPage(name: "/purchase_info", page: () => PurchaseInfo()),
    GetPage(name: "/licence_info", page: () => LicenceInfo()),
    GetPage(name: "/assign_info", page: () => AssignInfo()),
    GetPage(name: "/add_user", page: () => AddUser()),
    GetPage(name: "/all_users", page: () => AllUsers()),
  ];
}
