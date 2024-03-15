import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/utils/app_images.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/view/custom_component/custom_circular_progress_indicator.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';
import 'package:quizzy_app/view/custom_component/settings/custom_list_tile.dart';
import 'package:quizzy_app/view/custom_component/settings/custom_top_section_of_settings_view.dart';
import 'package:quizzy_app/view_model/settings/settings_view_model.dart';

class SettingsView extends GetView<SettingsViewModel> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<SettingsViewModel>(
              id: "updateTopSectionOfSettingView",
              builder: (controller) {
                return CustomTopSectionOfSettingsView(
                  emailOrPhoneValue: controller.emailOrPhone,
                  name: controller.name,
                  imageUrl: controller.photo,
                );
              },
            ),
            25.verticalSpace,
            RPadding(
              padding: REdgeInsets.symmetric(horizontal: 10),
              child: const Divider(),
            ),
            15.verticalSpace,
            Container(
              margin: REdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomText(
                    text: 'اعدادات الحساب',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Cairo",
                    color: primayColor,
                    alignment: AlignmentDirectional.topEnd,
                  ),
                  20.verticalSpace,
                  CustomListTile(
                    onTap: () {
                      controller.updateAccountViewRoute();
                    },
                    text: 'تعديل الحساب',
                  ),
                  CustomListTile(
                    onTap: () {
                      controller.updateChangePasswordViewRoute();
                    },
                    text: 'تغيير كلمة السر',
                  ),
                  CustomListTile(
                    onTap: () {
                      controller.balanceViewRoute();
                    },
                    text: 'رصيدي',
                  ),
                  GetBuilder<SettingsViewModel>(
                    id: "updateNotification",
                    builder: (controller) {
                      return CustomListTile(
                        onTap: () {
                          controller.updateNotification();
                        },
                        text: 'الاشعارات',
                        imageWidget: Switch(
                          value: controller.isNotificationEnabled,
                          onChanged: (value) async {
                            await controller.updateNotification();
                          },
                        ),
                      );
                    },
                  ),
                  GetBuilder<SettingsViewModel>(
                    id: "updatDarkMode",
                    builder: (controller) {
                      return CustomListTile(
                        onTap: () {
                          controller.updatDarkMode();
                        },
                        text: 'الوضع الليلي',
                        imageWidget: Switch(
                          value: controller.isDarkMode,
                          onChanged: (value) async {
                            await controller.updatDarkMode();
                          },
                        ),
                      );
                    },
                  ),
                ], // تغيير كلمة السر
              ),
            ),
            25.verticalSpace,
            RPadding(
              padding: REdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            Container(
              margin: REdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  15.verticalSpace,
                  CustomText(
                    text: 'سياسة الاستخدام',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Cairo",
                    color: primayColor,
                    alignment: AlignmentDirectional.topEnd,
                  ),
                  15.verticalSpace,
                  CustomListTile(
                    onTap: () {
                      controller.privacyPolicyRoute();
                    },
                    text: 'سياسة الخصوصية',
                  ),
                  CustomListTile(
                    onTap: () {
                      controller.termsRoute();
                    },
                    text: 'الشروط',
                  ),
                  CustomListTile(
                      onTap: () async {
                        print("OK");
                        await controller.logout();
                      },
                      text: 'تسجيل الخروج',
                      imageWidget: RPadding(
                        padding: REdgeInsets.only(left: 5),
                        child: Image.asset(
                          Assets.logout,
                          cacheHeight: 22,
                          fit: BoxFit.cover,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
