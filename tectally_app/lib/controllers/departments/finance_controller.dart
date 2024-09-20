import 'package:get/get.dart';

class FinanceController extends GetxController {
  var financeList = [].obs;
  var filteredFinanceList = [].obs; // List to store filtered results

  updateFinanceList(list) {
    financeList.value = list;
    filteredFinanceList.value = list; // Initialize filtered list
  }

  void filterFinance(String query) {
    if (query.isEmpty) {
      filteredFinanceList.value =
          financeList; // Reset to original list if query is empty
    } else {
      filteredFinanceList.value = financeList
          .where((Finance) =>
              Finance.emp_name.toLowerCase().contains(query.toLowerCase()) ||
              Finance.emp_phone.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
