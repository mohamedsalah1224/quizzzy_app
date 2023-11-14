import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/utils/app_images.dart';

import '../../../view_model/bottomNavigation/mange_bottom_navigation_view_model.dart';

class ManageBottomNavigationView
    extends GetView<ManageBottomNavigationViewModel> {
  const ManageBottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ManageBottomNavigationViewModel>(
        init: ManageBottomNavigationViewModel(),
        builder: (controller) {
          return controller.myScreen[controller.currentIndex];
        },
      ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: GetBuilder<ManageBottomNavigationViewModel>(
          builder: (controller) {
            return CurvedNavigationBar(
              color: Color.fromRGBO(38, 140, 109, 1),
              backgroundColor: Colors.transparent,
              animationDuration: Duration(milliseconds: 200),
              onTap: (value) {
                controller.changeIndex(value);
              },
              items: [
                CurvedNavigationBarItem(
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                  label: "الرئيسية",
                  child: Image.asset(
                    Assets.imagesHome,
                    cacheHeight: 24,
                    cacheWidth: 24,
                    color: Colors.white,
                  ),
                ),
                CurvedNavigationBarItem(
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                  label: "دردشة",
                  child: Image.asset(Assets.imagesChat,
                      color: Colors.white, cacheHeight: 24, cacheWidth: 24),
                ),
                CurvedNavigationBarItem(
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                  label: "اختبارات",
                  child: Image.asset(Assets.imagesExam,
                      color: Colors.white, cacheHeight: 24, cacheWidth: 24),
                ),
                CurvedNavigationBarItem(
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                  label: "حساب",
                  child: Image.asset(Assets.imagesAccount,
                      color: Colors.white, cacheHeight: 24, cacheWidth: 24),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
