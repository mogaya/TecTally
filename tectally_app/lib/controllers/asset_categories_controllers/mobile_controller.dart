import 'package:get/get.dart';

class MobileController extends GetxController {
  var mobileList = [].obs;
  var filteredMobileList = [].obs; // List to store filtered results

  updateMobileList(list) {
    mobileList.value = list;
    filteredMobileList.value = list; // Initialize filtered list
  }

  void filterMobiles(String query) {
    if (query.isEmpty) {
      filteredMobileList.value =
          mobileList; // Reset to original list if query is empty
    } else {
      filteredMobileList.value = mobileList
          .where((mobile) =>
              mobile.ast_name.toLowerCase().contains(query.toLowerCase()) ||
              mobile.ast_tag.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
