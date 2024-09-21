import 'package:get/get.dart';

class ProcurementController extends GetxController {
  var procurementList = [].obs;
  var filteredProcurementList = [].obs; // List to store filtered results

  updateProcurementList(list) {
    procurementList.value = list;
    filteredProcurementList.value = list; // Initialize filtered list
  }

  void filterProcurement(String query) {
    if (query.isEmpty) {
      filteredProcurementList.value =
          procurementList; // Reset to original list if query is empty
    } else {
      filteredProcurementList.value = procurementList
          .where((procurement) =>
              procurement.emp_name
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              procurement.emp_phone.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
