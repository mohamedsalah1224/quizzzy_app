import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/view/screens/account_view.dart';
import 'package:quizzy_app/view/screens/chat_view.dart';
import 'package:quizzy_app/view/screens/exam_view.dart';
import 'package:quizzy_app/view/screens/home_view.dart';

class ManageBottomNavigationViewModel extends GetxController {
  List<Widget> myScreen = [
    const HomeView(),
    const AccountView(),
    const ExamView(),
    const ChatView()
  ];

  int currentIndex = 0;

  void changeIndex(int value) {
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
