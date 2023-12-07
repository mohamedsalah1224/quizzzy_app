import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/utils/form_validator.dart';

import '../../utils/routes.dart';

class LoginViewModel extends GetxController {
  String initViewModel = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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

  String? validatePhoneOrEmail({String? value}) {
    return FormValidator.instance.validatePhoneOrEmail(value);
  }

  String? validatePasword({String? value}) {
    return FormValidator.instance.passwordValidator(value);
  }

  void createAccount() {
    Get.toNamed(Routes.registerView);
  }

  void forgetPassword() {
    Get.toNamed(Routes.forgetPasswordView);
  }

  void login() {
    if (loginFormKey.currentState!.validate())
      Get.offAllNamed(Routes.bottomNavgation);
  }
}
