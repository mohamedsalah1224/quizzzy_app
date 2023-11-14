import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pinput/pinput.dart';

class VerifyEmailViewModel extends GetxController {
  String initVerifyEmailViewModel = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pinController = TextEditingController();
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

  void confirm() {
    focusNode.unfocus();
    if (formKey.currentState!.validate()) {
      print(pinController.text);
      // go to another Route
    }
  }

  String? validatePinCode(String? value) {
    return value == "2222" ? null : "هذا الكود خطأ";
  }
}
