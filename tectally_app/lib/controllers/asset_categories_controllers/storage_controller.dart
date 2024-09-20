import 'package:get/get.dart';

class StorageController extends GetxController {
  var storageList = [].obs;
  var filteredStorageList = [].obs; // List to store filtered results

  updateStorageList(list) {
    storageList.value = list;
    filteredStorageList.value = list; // Initialize filtered list
  }

  void filterStorages(String query) {
    if (query.isEmpty) {
      filteredStorageList.value =
          storageList; // Reset to original list if query is empty
    } else {
      filteredStorageList.value = storageList
          .where((storage) =>
              storage.ast_name.toLowerCase().contains(query.toLowerCase()) ||
              storage.ast_tag.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
