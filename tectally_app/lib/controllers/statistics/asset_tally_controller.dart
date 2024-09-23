import 'package:get/get.dart';

class AssetTallyController extends GetxController {
  var totalAssets = 0.obs;
  var totalComputers = 0.obs;
  var totalMobiles = 0.obs;
  var othersAssetsTally = 0.obs;
  var storageTally = 0.obs;
  var peripheralsTally = 0.obs;
  var printersTally = 0.obs;
  var networkingTally = 0.obs;
  var mobilesTally = 0.obs;
  var computersTally = 0.obs;

  void updateTotalAssets(int num) => totalAssets.value = num;
  void updateComputers(int num) => computersTally.value = num;
  void updateMobiles(int num) => mobilesTally.value = num;
  void updateNetworking(int num) => networkingTally.value = num;
  void updatePrinters(int num) => printersTally.value = num;
  void updatePeripherals(int num) => peripheralsTally.value = num;
  void updateStorage(int num) => storageTally.value = num;
  void updateOtherAssets(int num) => othersAssetsTally.value = num;
}
