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

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int value) {
    if (_currentIndex == 2 && value != 2) {
      print("Resest The MangeVieModel");
      manageExamViewModel.resetController();
    }
    _currentIndex = value;
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
