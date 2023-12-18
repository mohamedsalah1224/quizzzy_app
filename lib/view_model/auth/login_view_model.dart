import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/Firebase/social_service/repository/social_repository.dart';
import 'package:quizzy_app/Service/Firebase/social_service/repository_implementaion_service/apple_repository_service.dart';
import 'package:quizzy_app/Service/Firebase/social_service/repository_implementaion_service/facebook_repository_service.dart';
import 'package:quizzy_app/Service/Firebase/social_service/repository_implementaion_service/google_repository_Service.dart';
import 'package:quizzy_app/Service/Firebase/social_service/repository_implementaion_service/social_repository_manger_service.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/auth_repository_service.dart';
import 'package:quizzy_app/Service/local/auth_token_service.dart';
import 'package:quizzy_app/model/auth_model.dart';
import 'package:quizzy_app/model/genral_response_mode.dart';
import 'package:quizzy_app/model/login_model.dart';
import 'package:quizzy_app/model/social_login_model.dart';
import 'package:quizzy_app/model/social_service_response_model.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/utils/form_validator.dart';
import 'package:quizzy_app/utils/general_utils.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';
import 'package:quizzy_app/utils/validation.dart';
import 'package:quizzy_app/view_model/auth/register_view_model.dart';

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
      if (!authModel.data!.user!.hasVerifiedEmail!) {
        Get.offAndToNamed(Routes.verifyEmailView);
        // to verify Email
      } else {
        Get.offAllNamed(Routes.bottomNavgation); // go to the home Page
      }
    }
  }

///////////////////////////////////// Social Logain Logic /////////////////////////////////////////////
  Future<AuthModel?> _loginBySocialService(
      {required SocialLoginModel socialLoginModel}) async {
    try {
      AuthModel authModel = await AuthRepositoryService.instance
          .socialLogin(socialLoginModel: socialLoginModel);

      if (authModel.success!) {
        await _cacheAcessToken(
            acessToken: authModel.data!.accessToken!); // Cache Acess Token
        print('*' * 50);
        print("Acess Toke ${authModel.data!.accessToken}");
        print('*' * 50);
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

  SocialRepository _getObjectTypeOfSocailLoin(
      {required SocialMediaType socialMediaType}) {
    if (socialMediaType == SocialMediaType.apple) {
      return AppleRepositoryService();
    } else if (socialMediaType == SocialMediaType.google) {
      return GoogleRepositoryService();
    } else {
      return FacebookRepositoryService();
    }
  }

  Future<void> handelScoialAccountRouteProcess(
      {required String providerId, required String providerType}) async {
    GeneralResponseModel generalResponseModel =
        await AuthRepositoryService.instance.checkUser(
            value: providerId); // Check if the providerId ID Exist or not
    print(generalResponseModel.success);
    print(providerId);
    print(providerType);
    print('-' * 80);
    if (generalResponseModel.success!) {
      AuthModel? autModel = await _loginBySocialService(
          socialLoginModel: SocialLoginModel(
              providerId: providerId,
              providerType: providerType)); // call Social Service , cache Token

      if (autModel == null) return; // if any erro occur in social Service

      // check Veify Phone or Not
      !autModel.data!.user!.phoneVerified!
          ? Get.offAndToNamed(Routes.verifyPhoneView)
          : Get.offAllNamed(Routes.bottomNavgation);
    } else {
      // this mean the provider id must collect a some of Inforamtion
      // go to Sign Up View
      // and Verify Phone in the Logic  in Reigste View Model

      Get.toNamed(Routes.registerView);
      Get.put(RegisterViewModel());
      Get.find<RegisterViewModel>().activeSocial(
          providerIdValue: providerId,
          providerTypeValue:
              providerType); // to mark the Register View to Collect Social Inforamtion only  , pass ProviderId , providerType
    }
  }

  Future<void> socialLoginButton(
      {required SocialMediaType socialMediaType}) async {
    SocialRepository socialRepository = _getObjectTypeOfSocailLoin(
        socialMediaType: socialMediaType); // to get the object

    SocialServiceResponseModel socialServiceResponseModel =
        await SocialRepositoryMangerService()
            .login(socialRepository); // apply Polymarphism

    if (socialServiceResponseModel.status) {
      SnackBarHelper.instance
          .showMessage(message: socialServiceResponseModel.message!);
      // checkUser
      await handelScoialAccountRouteProcess(
          providerId: socialServiceResponseModel.providerId!,
          providerType: socialServiceResponseModel
              .providertype!); // to show where the Next Route
    } else {
      SnackBarHelper.instance.showMessage(
          message: socialServiceResponseModel.message!, erro: true);
    }

    /*
      How to Think The Logic:
          know the Object of socialMediaType to pass it to socialRepoitoryServiceManger
         1-  do ploymarphism and get the Provide Id of the Socail Type
         2- checkUser ? if exist  ,checkVerifyPhone or not ? go to Home Page : 
           if not exist got ot SignUpView , call Socail Login Service , then cache Token 
           then Verify Phone Number 
      */
  }

  Future<void> registerInformationOfSocial(
      {required SocialLoginModel socialLoginModel}) async {
    AuthModel? autModel =
        await _loginBySocialService(socialLoginModel: socialLoginModel);
    if (autModel == null) return; // if any erro Occur

    // // check Veify Phone or Not
    // !autModel.data!.user!.phoneVerified!
    //     ? Get.toNamed(Routes.verifyPhoneView)
    //     : Get.offAllNamed(Routes.bottomNavgation);
    Get.offAllNamed(Routes.bottomNavgation);
  }
}
