import 'package:get/get.dart';

class OtherDepartmentsController extends GetxController {
  var otherDepartmentsList = [].obs;
  var filteredOtherDepartmentsList = [].obs; // List to store filtered results

  updateOtherDepartmentsList(list) {
    otherDepartmentsList.value = list;
    filteredOtherDepartmentsList.value = list; // Initialize filtered list
  }

  void filterOtherDepartments(String query) {
    if (query.isEmpty) {
      filteredOtherDepartmentsList.value =
          otherDepartmentsList; // Reset to original list if query is empty
    } else {
      filteredOtherDepartmentsList.value = otherDepartmentsList
          .where((otherDepartments) =>
              otherDepartments.emp_name
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              otherDepartments.emp_phone
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    }
  }
}
