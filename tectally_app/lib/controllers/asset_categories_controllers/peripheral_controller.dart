import 'package:get/get.dart';

class PeripheralController extends GetxController {
  var peripheralList = [].obs;
  var filteredPeripheralList = [].obs; // List to store filtered results

  updatePeripheralList(list) {
    peripheralList.value = list;
    filteredPeripheralList.value = list; // Initialize filtered list
  }

  void filterPeripherals(String query) {
    if (query.isEmpty) {
      filteredPeripheralList.value =
          peripheralList; // Reset to original list if query is empty
    } else {
      filteredPeripheralList.value = peripheralList
          .where((peripheral) =>
              peripheral.ast_name.toLowerCase().contains(query.toLowerCase()) ||
              peripheral.ast_tag.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
