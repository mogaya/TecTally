import 'package:get/get.dart';

class SigninController extends GetxController {
  var isHidden = true.obs;
  toggleHide() {
    isHidden.value = !isHidden.value;
  }

  var phoneNumber = ''.obs;

  updatePhoneNumber(num) {
    phoneNumber.value = num;
  }
}
