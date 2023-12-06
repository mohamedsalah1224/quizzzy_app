import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:quizzy_app/utils/form_validator.dart';

import 'package:quizzy_app/utils/routes.dart';

import '../../utils/validation.dart';

class ForgetPasswordViewModel extends GetxController {
  String initForgetPassword = "";

  GlobalKey<FormState> forgetPasswordformKey = GlobalKey<FormState>();

  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  void send() {
    print(emailOrPhoneController.text);

    if (forgetPasswordformKey.currentState!.validate()) {
      if (Validation.instance.isEmail(email: emailOrPhoneController.text)) {
        Get.toNamed(Routes.identifyEmailview);
      } else {
        Get.toNamed(Routes.identifyPhoneview);
      }
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  String? validatePhoneOrEmail({String? value}) {
    return FormValidator.instance
        .validatePhoneOrEmail(value, startPlusCode: true);
  }

  String? validatePaswword({String? value}) {
    return FormValidator.instance.passwordValidator(value);
  }
  // confirmPasswordValidator

  String? confirmPasswordValidator({String? value}) {
    return FormValidator.instance.confirmPasswordValidator(
        passwordConfirmController.text, passwordController.text);
  }

  void changePassword() {
    if (changePasswordFormKey.currentState!.validate()) {
      print("Change Password");
      print(passwordController.text);
      Get.toNamed(Routes.sucessPasswordChanged);
    }
  }
}
