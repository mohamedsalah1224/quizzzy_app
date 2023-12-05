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
  GlobalKey<FormState> identifyformKey = GlobalKey<FormState>();
  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  TextEditingController pinController = TextEditingController();
  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  String pinCode = "";
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12).r,
      border: Border.all(color: Color.fromRGBO(23, 171, 144, 0.4)),
    ),
  );

  final focusNode = FocusNode();

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
    pinController.dispose();
    focusNode.dispose();
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

  void confirmEmail() {
    focusNode.unfocus();
    if (identifyformKey.currentState!.validate()) {
      print(pinController.text);

      Get.toNamed(Routes.changePasswordView);
    }
  }

  void confirmPhone() {
    focusNode.unfocus();
    if (identifyformKey.currentState!.validate()) {
      print(pinController.text);

      Get.offNamed(Routes.changePasswordView);
    }
  }

  void changePassword() {
    if (changePasswordFormKey.currentState!.validate()) {
      print("Change Password");
      print(passwordController.text);
      Get.toNamed(Routes.sucessPasswordChanged);
    }
  }

  String? validatePinCode(String? value) {
    return value == pinCode ? null : "هذا الكود خطأ";
  }
}
