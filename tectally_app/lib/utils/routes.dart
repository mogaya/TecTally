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
import 'package:tectally_app/views/pages/suppPages/assetCategories/computers.dart';
import 'package:tectally_app/views/pages/suppPages/assetCategories/mobile.dart';
import 'package:tectally_app/views/pages/suppPages/assetCategories/networking.dart';
import 'package:tectally_app/views/pages/suppPages/assetCategories/others.dart';
import 'package:tectally_app/views/pages/suppPages/assetCategories/peripherals.dart';
import 'package:tectally_app/views/pages/suppPages/assetCategories/storage.dart';
import 'package:tectally_app/views/pages/suppPages/assetIdentity.dart';
import 'package:tectally_app/views/pages/suppPages/assetInventory.dart';
import 'package:tectally_app/views/pages/suppPages/assignInfo.dart';
import 'package:tectally_app/views/pages/suppPages/departments/financeUsers.dart';
import 'package:tectally_app/views/pages/suppPages/departments/hrUsers.dart';
import 'package:tectally_app/views/pages/suppPages/departments/ictUsers.dart';
import 'package:tectally_app/views/pages/suppPages/departments/otherUsers.dart';
import 'package:tectally_app/views/pages/suppPages/licenceInfo.dart';
import 'package:tectally_app/views/pages/suppPages/departments/procurementUsers.dart';
import 'package:tectally_app/views/pages/suppPages/purchaseInfo.dart';
import 'package:tectally_app/views/pages/test.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => const Landing()),
    GetPage(name: "/signin", page: () => const SignIn()),
    GetPage(name: "/signup", page: () => SignUp()),
    GetPage(name: "/navigator", page: () => const Nav()),
    GetPage(name: "/home", page: () => const Home()),
    GetPage(name: "/statistics", page: () => const Statistics()),
    GetPage(name: "/profile", page: () => const Profile()),
    GetPage(name: "/bookmarks", page: () => const Bookmark()),

    // Test
    GetPage(name: "/test", page: () => const Test()),

    // supplimentary Pages
    GetPage(name: "/add_asset", page: () => const AssetIdentity()),
    GetPage(name: "/purchase_info", page: () => PurchaseInfo()),
    GetPage(name: "/licence_info", page: () => LicenceInfo()),
    GetPage(name: "/assign_info", page: () => AssignInfo()),
    GetPage(name: "/add_user", page: () => const AddUser()),
    GetPage(name: "/all_users", page: () => const AllUsers()),
    GetPage(name: "/asset_inventory", page: () => const AssetInventory()),

    // departments
    GetPage(name: "/hr_users", page: () => const HrUsers()),
    GetPage(name: "/ict_users", page: () => const IctUsers()),
    GetPage(name: "/finance_users", page: () => const FinanceUsers()),
    GetPage(name: "/procurement_users", page: () => const ProcurementUsers()),
    GetPage(name: "/other_users", page: () => const OtherUsers()),

    // asset categories
    GetPage(name: "/computers", page: () => const Computers()),
    GetPage(name: "/mobile", page: () => const Mobile()),
    GetPage(name: "/networking", page: () => const Networking()),
    GetPage(name: "/others", page: () => const Others()),
    GetPage(name: "/peripherals", page: () => const Peripherals()),
    GetPage(name: "/storage", page: () => const Storage()),
  ];
}
