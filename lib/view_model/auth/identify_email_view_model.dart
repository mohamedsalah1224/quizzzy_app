import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pinput/pinput.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/email_repository_service.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/forget_password_repository_service.dart';
import 'package:quizzy_app/model/genral_response_mode.dart';
import 'package:quizzy_app/model/resend_verify_email_model.dart';
import 'package:quizzy_app/utils/routes.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';
import 'package:quizzy_app/view_model/auth/forget_password_view_model.dart';

class IdentifyEmailViewModel extends GetxController {
  late String email;

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
    super.onInit();
    email = Get.find<ForgetPasswordViewModel>().emailOrPhoneValue;
    print("Veify Email Page");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pinController.dispose();
    focusNode.dispose();
  }

  Future<void> confirmEmail() async {
    focusNode.unfocus();
    if (identifyformKey.currentState!.validate()) {
      print('-' * 50);
      print(pinController.text);
      print(email);

      await verifyCode(email: email, code: pinController.text);
    }
  }

  String? validatePinCode(String? value) {
    return value == null || value.isEmpty || value.length < 4
        ? "هذا الكود خطأ"
        : null;
  }

  ////////////////Api Service////////

  Future<void> verifyCode({required String email, required String code}) async {
    try {
      GeneralResponseModel generalResponseModel =
          await ForgetPasswordRepositoryService()
              .verifyCode(email: email, code: code);

      if (generalResponseModel.success!) {
        SnackBarHelper.instance
            .showMessage(message: generalResponseModel.message!);
        Get.toNamed(Routes.changePasswordView);
      } else {
        SnackBarHelper.instance
            .showMessage(message: generalResponseModel.message!, erro: true);
      }
    } catch (e) {
      print(e);
      SnackBarHelper.instance.showMessage(message: e.toString(), erro: true);
    }
  }

  Future<void> reSendCode() async {
    try {
      ReSendVeifyEmailModel reSendVeifyEmailModel =
          await EmailRepositoryService().reSendVerifyEmail(email: email);

      if (reSendVeifyEmailModel.success!) {
        SnackBarHelper.instance
            .showMessage(message: reSendVeifyEmailModel.message!);
      } else {
        SnackBarHelper.instance
            .showMessage(message: reSendVeifyEmailModel.message!, erro: true);
      }
    } catch (e) {
      SnackBarHelper.instance.showMessage(message: e.toString(), erro: true);
    }
  }
}
