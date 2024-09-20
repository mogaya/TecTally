import 'package:get/get.dart';

class PrinterController extends GetxController {
  var printerList = [].obs;
  var filteredPrinterList = [].obs; // List to store filtered results

  updatePrinterList(list) {
    printerList.value = list;
    filteredPrinterList.value = list; // Initialize filtered list
  }

  void filterPrinters(String query) {
    if (query.isEmpty) {
      filteredPrinterList.value =
          printerList; // Reset to original list if query is empty
    } else {
      filteredPrinterList.value = printerList
          .where((printer) =>
              printer.ast_name.toLowerCase().contains(query.toLowerCase()) ||
              printer.ast_tag.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
