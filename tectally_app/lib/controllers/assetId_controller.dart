import 'package:get/get.dart';

class AssetidController extends GetxController {
  var assetId = 0.obs;

  updateAssetId(num) {
    assetId.value = num;
  }
}
