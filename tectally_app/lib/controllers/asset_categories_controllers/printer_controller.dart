import 'package:get/get.dart';

class PrinterController extends GetxController {
  var printerList = [].obs;

  updatePrinterList(list) {
    printerList.value = list;
  }
}
