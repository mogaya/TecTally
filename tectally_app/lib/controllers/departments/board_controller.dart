import 'package:get/get.dart';

class BoardController extends GetxController {
  var boardList = [].obs;
  var filteredBoardList = [].obs; // List to store filtered results

  updateBoardList(list) {
    boardList.value = list;
    filteredBoardList.value = list; // Initialize filtered list
  }

  void filterBoard(String query) {
    if (query.isEmpty) {
      filteredBoardList.value =
          boardList; // Reset to original list if query is empty
    } else {
      filteredBoardList.value = boardList
          .where((board) =>
              board.emp_name.toLowerCase().contains(query.toLowerCase()) ||
              board.emp_phone.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
