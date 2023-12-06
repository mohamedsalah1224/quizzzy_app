import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pinput/pinput.dart';
import 'package:quizzy_app/utils/routes.dart';

class IdentifyEmailViewModel extends GetxController {
  String initVerifyEmailViewModel = "";
  String pinCode = "4444";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pinController = TextEditingController();
  GlobalKey<FormState> identifyformKey = GlobalKey<FormState>();

  final focusNode = FocusNode();

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("Veify Email Page");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pinController.dispose();
    focusNode.dispose();
  }

  void confirmEmail() {
    focusNode.unfocus();
    if (identifyformKey.currentState!.validate()) {
      print(pinController.text);

      Get.toNamed(Routes.changePasswordView);
    }
  }

  String? validatePinCode(String? value) {
    return value == pinCode ? null : "هذا الكود خطأ";
  }
}
