import 'package:get/get.dart';

class SigninController extends GetxController {
  var isHidden = true.obs;
  toggleHide() {
    isHidden.value = !isHidden.value;
  }

  var phoneNumber = ''.obs;
  var userId = 1.obs;
  var userName = ''.obs;

  void updatePhoneNumber(String phone) => phoneNumber.value = phone;
  void updateUserId(int num) => userId.value = num;
  void updateUserName(String name) => userName.value = name;
}
