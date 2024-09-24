import 'package:get/get.dart';

class EmployeeTallyController extends GetxController {
  var totalEmployees = 0.obs;
  var boardTally = 0.obs;
  var financeTally = 0.obs;
  var hrTally = 0.obs;
  var ictTally = 0.obs;
  var procurementTally = 0.obs;
  var prTally = 0.obs;
  var otherDepartmentsTally = 0.obs;

  void updateTotalEmployees(int num) => totalEmployees.value = num;
  void updateBoardTally(int num) => boardTally.value = num;
  void updateFinanceTally(int num) => financeTally.value = num;
  void updateHrTally(int num) => hrTally.value = num;
  void updateIctTally(int num) => ictTally.value = num;
  void updateProcurementTally(int num) => procurementTally.value = num;
  void updatePrTally(int num) => prTally.value = num;
  void updateOtherDepartmentsTally(int num) =>
      otherDepartmentsTally.value = num;
}
