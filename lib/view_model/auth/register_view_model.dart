import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pinput/pinput.dart';
import 'package:quizzy_app/utils/validation.dart';

import '../../utils/form_validator.dart';
import '../../utils/routes.dart';

class RegisterViewModel extends GetxController {
  String initRegisterViewModel = "";
  String pinCode = "4444";
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> continueRegisterFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> verifyFormKey = GlobalKey<FormState>(); //identifyformKey

  TextEditingController pinController =
      TextEditingController(); // passwordController
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailOrPhoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
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

  String? validatePhoneOrEmail({String? value}) {
    return FormValidator.instance
        .validatePhoneOrEmail(value, startPlusCode: true);
  }

  String? validateName({String? value}) {
    return FormValidator.instance.anyTextFormValidator(value, "Name");
  }

  String? validateUserName({String? value}) {
    return FormValidator.instance.anyTextFormValidator(value, "User Name");
  }

  String? validateBirthDate({String? value}) {
    return FormValidator.instance.anyTextFormValidator(value, "Birth Data");
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
    if (verifyFormKey.currentState!.validate()) {
      print(pinController.text);

      Get.toNamed(Routes.continueRegisterView);
    }
  }

  void confirmPhone() {
    focusNode.unfocus();
    if (verifyFormKey.currentState!.validate()) {
      print(pinController.text);

      Get.offNamed(Routes.continueRegisterView);
    }
  }

  String? validatePinCode(String? value) {
    return value == pinCode ? null : "هذا الكود خطأ";
  }

  void continueregisterView() {
    if (registerFormKey.currentState!.validate()) {
      if (Validation.instance.isEmail(email: emailOrPhoneController.text)) {
        Get.toNamed(Routes.verifyEmailView);
      } else {
        Get.toNamed(Routes.verifyPhoneView);
      }
    }
  }

  void logIn() {
    if (continueRegisterFormKey.currentState!.validate()) {
      Get.offAllNamed(Routes.loginView);
    }
  }
}
