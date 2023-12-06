import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:quizzy_app/utils/validation.dart';

import '../../utils/form_validator.dart';
import '../../utils/routes.dart';

class RegisterViewModel extends GetxController {
  String initRegisterViewModel = "";

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> continueRegisterFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailOrPhoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

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
