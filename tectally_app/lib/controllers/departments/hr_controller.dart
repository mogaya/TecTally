import 'package:get/get.dart';

class HrController extends GetxController {
  var hrList = [].obs;
  var filteredHrList = [].obs; // List to store filtered results

  updateHrList(list) {
    hrList.value = list;
    filteredHrList.value = list; // Initialize filtered list
  }

  void filterHr(String query) {
    if (query.isEmpty) {
      filteredHrList.value = hrList; // Reset to original list if query is empty
    } else {
      filteredHrList.value = hrList
          .where((hr) =>
              hr.emp_name.toLowerCase().contains(query.toLowerCase()) ||
              hr.emp_phone.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
