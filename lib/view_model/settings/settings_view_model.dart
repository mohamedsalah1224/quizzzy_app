import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/Firebase/social_service/repository/social_repository.dart';
import 'package:quizzy_app/Service/Firebase/social_service/repository_implementaion_service/apple_repository_service.dart';
import 'package:quizzy_app/Service/Firebase/social_service/repository_implementaion_service/facebook_repository_service.dart';
import 'package:quizzy_app/Service/Firebase/social_service/repository_implementaion_service/google_repository_Service.dart';
import 'package:quizzy_app/Service/Firebase/social_service/repository_implementaion_service/social_repository_manger_service.dart';
import 'package:quizzy_app/Service/local/auth_route_service.dart';
import 'package:quizzy_app/Service/local/auth_token_service.dart';
import 'package:quizzy_app/Service/local/cache_subject_service.dart';
import 'package:quizzy_app/Service/local/cache_user_service.dart';
import 'package:quizzy_app/model/user_model.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/utils/dialog_helper.dart';
import 'package:quizzy_app/utils/general_utils.dart';
import 'package:quizzy_app/utils/routes.dart';

class SettingsViewModel extends GetxController {
  late User _user;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserFromCahce();
    print("Init Seetings View Model");
  }

//////////////////////////////////////////////// Getter ////////////////////////////////////////////
  String get name => _user.name?.trim() ?? "";
  String get emailOrPhone => _user.phone?.trim() ?? _user.email?.trim() ?? "";
  String? get photo => _user.photo;

/////////////////////////////////////////////// Helper Method //////////////////////////////////////////
  SocialRepository _getObjectTypeOfSocaiLogin(
      {required SocialMediaType socialMediaType}) {
    if (socialMediaType == SocialMediaType.apple) {
      return AppleRepositoryService();
    } else if (socialMediaType == SocialMediaType.google) {
      return GoogleRepositoryService();
    } else {
      return FacebookRepositoryService();
    }
  }
///////////////////////////////////////////////// Service /////////////////////////////////////////////////

  void getUserFromCahce() async {
    _user = CacheUserService.instance.getUser();
    // to cache the User Object
  }

  Future<void> updateUserCache({required User userValue}) async {
    _user = userValue;
    await CacheUserService.instance
        .updateUser(user: userValue); // to cache the User Object
  }

  Future<void> logout() async {
    Future.wait([
      CacheUserService.instance.deleteUser(),
      AuthRouteService.instance.logout(),
      AuthTokenService.instance.delete(),
      CacheSubjectService.instance.deleteSubjects()
    ]).then((value) => debugPrint("Delete the All Cache"));

    if (_user.providerType != null) {
      SocialRepository socialRepository = _getObjectTypeOfSocaiLogin(
          socialMediaType: GeneralUtils.instance
              .convertSocialMediaStringToEnum(_user.providerType!));

      await SocialRepositoryMangerService()
          .logout(socialRepository); // apply Polymarphism

      debugPrint("-" * 50);
      debugPrint("Log Out form ${_user.providerType!}");
      debugPrint("-" * 50);
    }

    Get.offAllNamed(Routes.loginView);
  }

////////////////////////////////////////// Route Method /////////////////////////////////////////////////////
  void settingViewPageRoute() {
    Get.toNamed(Routes.settingsView);
  }

  void notificationViewPageRoute() {
    Get.toNamed(Routes.notificationView);
  }

  void balanceViewRoute() {
    Get.toNamed(Routes.balanceView, arguments: _user);
  }

  void updateAccountViewRoute() {
    Get.toNamed(Routes.updateAccountView);
  }

  void updateChangePasswordViewRoute() {
    Get.toNamed(Routes.updateChangePasswordView);
  }
}
