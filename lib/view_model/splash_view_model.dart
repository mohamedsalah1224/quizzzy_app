import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository/profile_repository.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/profile_repository_service.dart';
import 'package:quizzy_app/Service/local/auth_route_service.dart';
import 'package:quizzy_app/Service/local/cache_user_service.dart';
import 'package:quizzy_app/Service/nottification/push_notification_service.dart';
import 'package:quizzy_app/utils/routes.dart';

class SplashViewModel extends GetxController {
  String splashTextInit = "";
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    Timer(const Duration(seconds: 2), () async {
      bool result = AuthRouteService.instance.readRoute();
      debugPrint("-" * 50);
      debugPrint("Route Exit : $result");
      debugPrint("-" * 50);
      if (result) {
        _getProfileService();
      } else {
        Get.offAllNamed(Routes.loginView);
      }
      // await PushNotificationService().initPushNotification();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }

  void _getProfileService() {
    PofileRepositoryService().getProfile().then((value) async {
      if (value.data!.isActive!) {
        await CacheUserService.instance
            .updateUser(user: value.data!); // to cache the User Object
        Get.offAllNamed(Routes.bottomNavgation);
      } else {
        Get.offAllNamed(Routes.loginView);
      }
    });
  }
}
