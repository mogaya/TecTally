import 'package:get/get.dart';

class PrController extends GetxController {
  var prList = [].obs;
  var filteredPrList = [].obs; // List to store filtered results

  updatePrList(list) {
    prList.value = list;
    filteredPrList.value = list; // Initialize filtered list
  }

  void filterPr(String query) {
    if (query.isEmpty) {
      filteredPrList.value = prList; // Reset to original list if query is empty
    } else {
      filteredPrList.value = prList
          .where((pr) =>
              pr.emp_name.toLowerCase().contains(query.toLowerCase()) ||
              pr.emp_phone.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
