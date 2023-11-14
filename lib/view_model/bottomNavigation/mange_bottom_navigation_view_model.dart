import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/view/screens/exam/manage_exam_view.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

import '../../view/screens/bottomNavigation/account_view.dart';
import '../../view/screens/bottomNavigation/chat_view.dart';
import '../../view/screens/bottomNavigation/home_view.dart';

class ManageBottomNavigationViewModel extends GetxController {
  ManageExamViewModel manageExamViewModel = Get.find<ManageExamViewModel>();
  List<Widget> myScreen = [
    const HomeView(),
    const ChatView(),
    const ManageExamView(),
    const AccountView(),
  ];

  int currentIndex = 0;

  void changeIndex(int value) {
    if (currentIndex == 2 && value != 2) {
      manageExamViewModel.resetController();
    }
    currentIndex = value;
    update();
  }

  @override
  void onInit() {
    print("Intlize the Bottom Navigation");
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    print("On Read");
    super.onReady();
  }
}
