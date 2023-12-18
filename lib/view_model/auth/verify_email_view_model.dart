import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pinput/pinput.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/email_repository_service.dart';
import 'package:quizzy_app/model/genral_response_mode.dart';
import 'package:quizzy_app/model/resend_verify_email_model.dart';
import 'package:quizzy_app/utils/routes.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';
import 'package:quizzy_app/view_model/auth/login_view_model.dart';

class VerifyEmailViewModel extends GetxController {
  int length = 6;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pinController = TextEditingController();
  GlobalKey<FormState> verifyFormKey = GlobalKey<FormState>();
  final focusNode = FocusNode();

  late String email;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12).r,
      border: Border.all(color: const Color.fromRGBO(23, 171, 144, 0.4)),
    ),
  );

  @override
  void onInit() {
    super.onInit();
    email = Get.find<LoginViewModel>().emailOrPhoneController.text;
  }

  @override
  void onClose() {
    super.onClose();
    pinController.dispose();
    focusNode.dispose();
  }

  Future<void> confirmEmail() async {
    focusNode.unfocus();
    if (verifyFormKey.currentState!.validate()) {
      await verifyCode(email: email, code: pinController.text);
    }
  }

  String? validatePinCode(String? value) {
    return value == null || value.isEmpty || value.length < length
        ? "هذا الكود خطأ"
        : null;
  }

  //////////////////////////////////////// Api Service ///////////////////////////////////////////////////////////////////////////

  Future<void> verifyCode({required String email, required String code}) async {
    try {
      GeneralResponseModel generalResponseModel = await EmailRepositoryService()
          .verifyEmailCode(email: email, code: code);

      if (generalResponseModel.success!) {
        SnackBarHelper.instance
            .showMessage(message: generalResponseModel.message!);
        Get.offAllNamed(Routes.bottomNavgation);
      } else {
        SnackBarHelper.instance
            .showMessage(message: generalResponseModel.message!, erro: true);
      }
    } catch (e) {
      SnackBarHelper.instance.showMessage(message: e.toString(), erro: true);
    }
  }

  Future<void> reSendCode() async {
    try {
      pinController.text = "";
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
