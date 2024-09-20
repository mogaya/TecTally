import 'package:get/get.dart';

class NetworkingController extends GetxController {
  var networkingList = [].obs;
  var filteredNetworkingList = [].obs; // List to store filtered results

  updateNetworkingList(list) {
    networkingList.value = list;
    filteredNetworkingList.value = list; // Initialize filtered list
  }

  void filterNetworkings(String query) {
    if (query.isEmpty) {
      filteredNetworkingList.value =
          networkingList; // Reset to original list if query is empty
    } else {
      filteredNetworkingList.value = networkingList
          .where((networking) =>
              networking.ast_name.toLowerCase().contains(query.toLowerCase()) ||
              networking.ast_tag.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
