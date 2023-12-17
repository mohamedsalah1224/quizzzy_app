import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/auth_repository_service.dart';
import 'package:quizzy_app/Service/local/auth_token_service.dart';
import 'package:quizzy_app/model/auth_model.dart';
import 'package:quizzy_app/model/login_model.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/utils/form_validator.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';
import 'package:quizzy_app/utils/validation.dart';

import '../../utils/routes.dart';

class LoginViewModel extends GetxController {
  String initViewModel = "";

  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('Init LoginView');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("close LoginView");
  }

  String? validatePhoneOrEmail({String? value}) {
    return FormValidator.instance.validatePhoneOrEmail(value);
  }

  String? validatePasword({String? value}) {
    return FormValidator.instance.passwordValidator(value);
  }

  void createAccount() {
    Get.toNamed(Routes.registerView);
  }

  void forgetPassword() {
    Get.toNamed(Routes.forgetPasswordView);
  }

  ////////////////////////////////// Goal Mehtods/////////////////////////////////

  void _loginBySocialService() {}
  Future<AuthModel?> _loginByEmailOrPhoneService(
      {required LoginModel loginModel}) async {
    try {
      AuthModel authModel =
          await AuthRepositoryService.instance.login(loginModel: loginModel);

      if (authModel.success!) {
        await _cacheAcessToken(
            acessToken: authModel.data!.accessToken!); // Cache Acess Token
        SnackBarHelper.instance
            .showMessage(message: authModel.message!.toString());
        return authModel;
      } else {
        SnackBarHelper.instance
            .showMessage(message: authModel.message!.toString(), erro: true);
      }
    } catch (e) {
      SnackBarHelper.instance.showMessage(message: e.toString(), erro: true);
    }
    return null;
  }

  Future<void> _cacheAcessToken({required String acessToken}) async {
    await AuthTokenService.instance.add(value: acessToken); // cache acess token
  }

  void loginButton() async {
    if (loginFormKey.currentState!.validate()) {
      // LoginService
      bool isEmail = Validation.instance.isEmail(
          email: emailOrPhoneController
              .text); // to know if the input imail or phone
      AuthModel? authModel = await _loginByEmailOrPhoneService(
          loginModel: LoginModel(
              email: isEmail ? emailOrPhoneController.text : '',
              password: passwordController.text,
              phone: !isEmail ? emailOrPhoneController.text : '',
              type: isEmail ? SourceLoginType.email : SourceLoginType.phone));
      if (authModel == null) {
        return; // if any erro occur skip return from this method
      }
      print('-' * 50);
      print(authModel.data!.user!.hasVerifiedEmail!); //
      print('-' * 50);
      if (!authModel.data!.user!.hasVerifiedEmail!) {
        Get.toNamed(Routes.verifyEmailView); // to verify Email
      } else {
        Get.offAllNamed(Routes.bottomNavgation); // go to the home Page
      }
    }
  }

  void socialLoginButton() {
    if (loginFormKey.currentState!.validate()) {
      /*
         1-  do ploymarphism and get the Provide Id of the Socail Type
         2- checkUser ? if exist cache Token ,checkVerifyPhone or not ? go to Home Page : 
           if not exist got ot SignUpView , call Socail Login Service , then cache Token 
           then Verify Phone Number 
      */
    }
  }
}
