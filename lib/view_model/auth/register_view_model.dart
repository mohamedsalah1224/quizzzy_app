import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pinput/pinput.dart';

import '../../utils/routes.dart';

class RegisterViewModel extends GetxController {
  String initRegisterViewModel = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pinController = TextEditingController();
  final focusNode = FocusNode();
  TextEditingController dateController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("On Init");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    dateController.dispose();
    pinController.dispose();
    focusNode.dispose();
  }

  Future<void> showDate(BuildContext context) async {
    await showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(1900),
            lastDate: DateTime(2023))
        .then((value) {
      if (value != null) {
        String date = DateFormat('yyy:MM:dd').format(value);
        dateController.text = date;
      }
    });
  }

  void continueRegister() {
    Get.toNamed(Routes.verifyEmailView);
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
      print("Go to LoginPage");
    }
  }

  String? validatePinCode(String? value) {
    return value == "2222" ? null : "هذا الكود خطأ";
  }
}
