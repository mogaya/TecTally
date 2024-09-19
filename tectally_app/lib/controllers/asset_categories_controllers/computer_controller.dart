import 'package:get/get.dart';

class ComputerController extends GetxController {
  var computerList = [].obs;

  updateComputerList(list) {
    computerList.value = list;
  }
}
