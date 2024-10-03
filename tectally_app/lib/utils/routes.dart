import 'package:get/get.dart';
import 'package:tectally_app/views/pages/chatBot.dart';
import 'package:tectally_app/views/pages/edit_profile.dart';
import 'package:tectally_app/views/pages/home.dart';
import 'package:tectally_app/views/pages/landing.dart';
import 'package:tectally_app/views/pages/nav.dart';
import 'package:tectally_app/views/pages/profile.dart';
import 'package:tectally_app/views/pages/signin.dart';
import 'package:tectally_app/views/pages/signup.dart';
import 'package:tectally_app/views/pages/statistics.dart';
import 'package:tectally_app/views/pages/downloads.dart';
import 'package:tectally_app/views/pages/suppPages/addUser.dart';
import 'package:tectally_app/views/pages/suppPages/allUsers.dart';
import 'package:tectally_app/views/pages/suppPages/assetCategories/computers.dart';
import 'package:tectally_app/views/pages/suppPages/assetCategories/mobile.dart';
import 'package:tectally_app/views/pages/suppPages/assetCategories/networking.dart';
import 'package:tectally_app/views/pages/suppPages/assetCategories/others.dart';
import 'package:tectally_app/views/pages/suppPages/assetCategories/peripherals.dart';
import 'package:tectally_app/views/pages/suppPages/assetCategories/printer.dart';
import 'package:tectally_app/views/pages/suppPages/assetCategories/storage.dart';
import 'package:tectally_app/views/pages/suppPages/add_asset/assetIdentity.dart';
import 'package:tectally_app/views/pages/suppPages/assetInventory.dart';
import 'package:tectally_app/views/pages/suppPages/add_asset/assignInfo.dart';
import 'package:tectally_app/views/pages/suppPages/barcodeScanner.dart';
import 'package:tectally_app/views/pages/suppPages/departments/board.dart';
import 'package:tectally_app/views/pages/suppPages/departments/finance.dart';
import 'package:tectally_app/views/pages/suppPages/departments/hr.dart';
import 'package:tectally_app/views/pages/suppPages/departments/ictUsers.dart';
import 'package:tectally_app/views/pages/suppPages/departments/other_departments.dart';
import 'package:tectally_app/views/pages/suppPages/departments/pr.dart';
import 'package:tectally_app/views/pages/suppPages/add_asset/licenceInfo.dart';
import 'package:tectally_app/views/pages/suppPages/departments/procurement.dart';
import 'package:tectally_app/views/pages/suppPages/add_asset/purchaseInfo.dart';
import 'package:tectally_app/views/pages/suppPages/add_asset/search_emp.dart';
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
    GetPage(name: "/edit_profile", page: () => const EditProfile()),
    GetPage(name: "/downloads", page: () => const Downloads()),
    GetPage(name: "/chat_bot", page: () => ChatBot()),

    // Test
    GetPage(name: "/test", page: () => const Test()),

    // supplimentary Pages
    GetPage(name: "/add_asset", page: () => const AssetIdentity()),
    GetPage(name: "/purchase_info", page: () => PurchaseInfo()),
    GetPage(name: "/licence_info", page: () => LicenceInfo()),
    GetPage(name: "/assign_info", page: () => AssignInfo()),
    GetPage(name: "/search_emp", page: () => const SearchEmp()),
    GetPage(name: "/add_user", page: () => const AddUser()),
    GetPage(name: "/all_users", page: () => const AllUsers()),
    GetPage(name: "/asset_inventory", page: () => const AssetInventory()),
    GetPage(name: "/barcode_scanner", page: () => const Barcodescanner()),

    // departments
    GetPage(name: "/board", page: () => const Board()),
    GetPage(name: "/hr", page: () => const Hr()),
    GetPage(name: "/pr", page: () => const Pr()),
    GetPage(name: "/ict", page: () => const Ict()),
    GetPage(name: "/finance", page: () => const Finance()),
    GetPage(name: "/procurement", page: () => const Procurement()),
    GetPage(name: "/other_departments", page: () => const OtherDepartments()),

    // asset categories
    GetPage(name: "/computers", page: () => const Computers()),
    GetPage(name: "/mobile", page: () => const Mobile()),
    GetPage(name: "/networking", page: () => const Networking()),
    GetPage(name: "/others", page: () => const OtherAssets()),
    GetPage(name: "/peripherals", page: () => const Peripherals()),
    GetPage(name: "/storage", page: () => const Storage()),
    GetPage(name: "/printers", page: () => const Printers()),
  ];
}
