import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/local/auth_route_service.dart';
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
        Get.offAllNamed(Routes.bottomNavgation);
      } else {
        Get.offAllNamed(Routes.loginView);
      }
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
}
