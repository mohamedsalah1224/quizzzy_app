import 'dart:async';

import 'package:get/get.dart';
import 'package:quizzy_app/utils/routes.dart';

class SplashViewModel extends GetxController {
  String splashTextInit = "";
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    Timer(const Duration(seconds: 2), () async {
      Get.offAllNamed(Routes.loginView);
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
