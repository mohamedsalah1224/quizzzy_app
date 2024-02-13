import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:quizzy_app/Service/local/auth_route_service.dart';
import 'package:quizzy_app/utils/routes.dart';

class VerifyPhoneViewModel extends GetxController {
  String initVerifyEmailViewModel = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pinController = TextEditingController();
  GlobalKey<FormState> verifyFormKey = GlobalKey<FormState>();
  String pinCode = "4444";
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
    print("Veify Phone Page");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pinController.dispose();
    focusNode.dispose();
  }

  void confirmPhone() async {
    focusNode.unfocus();
    if (verifyFormKey.currentState!.validate()) {
      print(pinController.text);
      await AuthRouteService.instance.logIn(); //  Add in VerifyCode
      Get.offAllNamed(Routes.bottomNavgation);
    }
  }

  String? validatePinCode(String? value) {
    return value == pinCode ? null : "هذا الكود خطأ";
  }
}
