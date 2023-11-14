import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'package:quizzy_app/utils/routes.dart';

class ForgetPasswordViewModel extends GetxController {
  String initForgetPassword = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pinController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  final focusNode = FocusNode();

  void send() {
    print(emailController.text);
    Get.toNamed(Routes.identifyEmailview);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pinController.dispose();
    focusNode.dispose();
  }

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

  void confirmEmail() {
    focusNode.unfocus();
    if (formKey.currentState!.validate()) {
      print(pinController.text);

      Get.toNamed(Routes.changePasswordView);
    }
  }

  void changePassword() {
    print("Change Password");
    print(passwordController.text);
    Get.toNamed(Routes.sucessPasswordChanged);
  }

  String? validatePinCode(String? value) {
    return value == "2222" ? null : "هذا الكود خطأ";
  }
}
