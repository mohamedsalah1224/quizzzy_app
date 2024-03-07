import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository/profile_repository.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/profile_repository_service.dart';

import 'package:quizzy_app/utils/form_validator.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';

class UpdateChangePasswordViewModel extends GetxController {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController get passwordController => _passwordController;
  TextEditingController get passwordConfirmController =>
      _passwordConfirmController;
  GlobalKey<FormState> get formKey => _formKey;
  @override
  void onInit() {
    super.onInit();
  }

/////////////////////////////////////////// Validate //////////////////////////////////
  String? validatePaswword({String? value}) {
    return FormValidator.instance.passwordValidator(value);
  }

  String? confirmPasswordValidator({String? value}) {
    return FormValidator.instance.confirmPasswordValidator(
        _passwordConfirmController.text, _passwordController.text);
  }

  void changePassword() {
    if (formKey.currentState!.validate()) {
      changePasswordService();
    }
  }
////////////////////////////////////////// Service ///////////////////////////////////////////

  void changePasswordService() {
    PofileRepositoryService()
        .updateProfile(password: _passwordController.text)
        .then((value) {
      if (value.success!) {
        SnackBarHelper.instance
            .showMessage(message: 'تم تغيير كلمة السر بنجاح ');
        Get.back();
      } else {
        SnackBarHelper.instance.showMessage(
          message: 'فشل في تغيير كلمة السر ',
          isEnglish: false,
        );
      }
    }).catchError((e) => SnackBarHelper.instance.showMessage(
            message: e.toString(),
            erro: true,
            showByGetx: true,
            isEnglish: false));
  }
}
