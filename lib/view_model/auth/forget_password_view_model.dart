import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/forget_password_repository_service.dart';
import 'package:quizzy_app/model/forget_password_model.dart';

import 'package:quizzy_app/utils/form_validator.dart';

import 'package:quizzy_app/utils/routes.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';

import '../../utils/validation.dart';

class ForgetPasswordViewModel extends GetxController {
  String initForgetPassword = "";
  String emailOrPhoneValue = "";

  GlobalKey<FormState> forgetPasswordformKey = GlobalKey<FormState>();

  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  void send() async {
    print(emailOrPhoneController.text);

    if (forgetPasswordformKey.currentState!.validate()) {
      emailOrPhoneValue = emailOrPhoneController.text;
      if (Validation.instance.isEmail(email: emailOrPhoneController.text)) {
        await _forgetPasswordByEmail();
      } else {
        _forgetPasswordByPhone();
      }
    }
  }

  Future<void> _forgetPasswordByEmail() async {
    try {
      ForgetPasswordModel forgetPasswordModel =
          await ForgetPasswordRepositoryService()
              .forgetPassword(email: emailOrPhoneValue);

      if (forgetPasswordModel.success!) {
        SnackBarHelper.instance
            .showMessage(message: forgetPasswordModel.message!);
        Get.toNamed(Routes.identifyEmailview);
      } else {
        SnackBarHelper.instance
            .showMessage(message: forgetPasswordModel.message!, erro: true);
      }
    } catch (e) {
      SnackBarHelper.instance.showMessage(message: e.toString(), erro: true);
    }
  }

  void _forgetPasswordByPhone() {
    Get.toNamed(Routes.identifyPhoneview);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  String? validatePhoneOrEmail({String? value}) {
    return FormValidator.instance.validatePhoneOrEmail(value);
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
