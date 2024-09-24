import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userName = ''.obs;
  var userPhone = ''.obs;
  var userEmail = ''.obs;
  var userOrganization = ''.obs;
  var userId = 1.obs;

  void updateUserId(int num) => userId.value = num;
  void updateUserName(String name) => userName.value = name;
  void updateUserPhone(String phone) => userPhone.value = phone;
  void updateUserEmail(String email) => userEmail.value = email;
  void updateUserOrganization(String organization) =>
      userOrganization.value = organization;
}
