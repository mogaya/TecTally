import 'package:get/get.dart';

class IctController extends GetxController {
  var ictList = [].obs;
  var filteredIctList = [].obs; // List to store filtered results

  updateIctList(list) {
    ictList.value = list;
    filteredIctList.value = list; // Initialize filtered list
  }

  void filterIct(String query) {
    if (query.isEmpty) {
      filteredIctList.value =
          ictList; // Reset to original list if query is empty
    } else {
      filteredIctList.value = ictList
          .where((ict) =>
              ict.emp_name.toLowerCase().contains(query.toLowerCase()) ||
              ict.emp_phone.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
