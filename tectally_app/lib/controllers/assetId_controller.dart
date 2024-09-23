import 'package:get/get.dart';

class AssetidController extends GetxController {
  var assetId = 8.obs;

  void updateAssetId(int num) => assetId.value = num;

  // updateAssetId(num) {
  //   assetId.value = num;
  // }
}
