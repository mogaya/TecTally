import 'package:get/get.dart';

class ComputerController extends GetxController {
  var computerList = [].obs;
  var filteredComputerList = [].obs; // List to store filtered results

  updateComputerList(list) {
    computerList.value = list;
    filteredComputerList.value = list; // Initialize filtered list
  }

  void filterComputers(String query) {
    if (query.isEmpty) {
      filteredComputerList.value =
          computerList; // Reset to original list if query is empty
    } else {
      filteredComputerList.value = computerList
          .where((computer) =>
              computer.ast_name.toLowerCase().contains(query.toLowerCase()) ||
              computer.ast_tag.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
