import 'package:get/get.dart';

class OtherAssetsController extends GetxController {
  var otherAssetsList = [].obs;
  var filteredOtherAssetsList = [].obs; // List to store filtered results

  updateOtherAssetsList(list) {
    otherAssetsList.value = list;
    filteredOtherAssetsList.value = list; // Initialize filtered list
  }

  void filterOtherAssets(String query) {
    if (query.isEmpty) {
      filteredOtherAssetsList.value =
          otherAssetsList; // Reset to original list if query is empty
    } else {
      filteredOtherAssetsList.value = otherAssetsList
          .where((otherAssets) =>
              otherAssets.ast_name
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              otherAssets.ast_tag.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
