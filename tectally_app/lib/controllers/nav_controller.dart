import 'package:get/get.dart';

class NavController extends GetxController {
  var selectedPage = 0.obs;
  setSelectedPage(index) {
    selectedPage.value = index;
  }
}
