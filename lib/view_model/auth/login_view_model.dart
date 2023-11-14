import 'package:get/get.dart';

import '../../utils/routes.dart';

class LoginViewModel extends GetxController {
  String initViewModel = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('Init LoginView');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("close LoginView");
  }

  void createAccount() {
    Get.toNamed(Routes.registerView);
  }

  void forgetPassword() {
    Get.toNamed(Routes.forgetPasswordView);
  }

  void login() {
    Get.offAllNamed(Routes.bottomNavgation);
  }
}
