import 'package:get/get.dart';
import 'package:quizzy_app/utils/routes.dart';

class SettingsViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print("Init Seetings View Model");
  }

////////////////////////////////////////// Route Method /////////////////////////////////////////////////////
  void settingViewPageRoute() {
    Get.toNamed(Routes.settingsView);
  }

  void balanceViewRoute() {
    Get.toNamed(Routes.settingsView);
  }

  void updateAccountViewRoute() {
    Get.toNamed(Routes.updateAccountView);
  }

  void updateChangePasswordViewRoute() {
    Get.toNamed(Routes.updateChangePasswordView);
  }

  void notificationViewPageRoute() {
    Get.toNamed(Routes.notificationView);
  }
}
