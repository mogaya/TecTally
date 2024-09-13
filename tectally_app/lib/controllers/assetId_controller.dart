import 'package:get/get.dart';

class AssetidController extends GetxController {
  var assetId = 8.obs;

  updateAssetId(num) {
    assetId.value = num;
  }
}
