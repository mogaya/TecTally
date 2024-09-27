import 'package:get/get.dart';

class SearchEmpController extends GetxController {
  var searchEmpList = [].obs;
  var filteredSearchEmpList = [].obs; // List to store filtered results
  var selectedEmp = ''.obs;
  var selectedDeparment = ''.obs;

  updateSearchEmpList(list) {
    searchEmpList.value = list;
    filteredSearchEmpList.value = list; // Initialize filtered list
  }

  void filterSearchEmps(String query) {
    if (query.isEmpty) {
      filteredSearchEmpList.value =
          searchEmpList; // Reset to original list if query is empty
    } else {
      filteredSearchEmpList.value = searchEmpList
          .where((searchEmp) =>
              searchEmp.emp_name.toLowerCase().contains(query.toLowerCase()) ||
              searchEmp.emp_phone.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void updateSelectedEmp(String emp) => selectedEmp.value = emp;
  void updateSelectedDepartment(String department) =>
      selectedDeparment.value = department;
}
