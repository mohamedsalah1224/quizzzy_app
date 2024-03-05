import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/utils/app_images.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/view/custom_component/custom_circular_progress_indicator.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';
import 'package:quizzy_app/view/custom_component/settings/custom_list_tile.dart';
import 'package:quizzy_app/view/custom_component/settings/custom_top_section_of_settings_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTopSectionOfSettingsView(
              emailOrPhoneValue: "065247854689",
              name: "الاء سعيد",
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
                      print("Welcome");
                    },
                    text: 'تعديل الحساب',
                  ),
                  CustomListTile(
                    onTap: () {
                      print("Welcome");
                    },
                    text: 'تغيير كلمة السر',
                  ),
                  CustomListTile(
                    onTap: () {
                      print("Welcome");
                    },
                    text: 'رصيدي',
                  ),
                  CustomListTile(
                    onTap: () {
                      print("Welcome");
                    },
                    text: 'الاشعارات',
                    imageWidget: Switch(
                      value: true,
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                  CustomListTile(
                    onTap: () {
                      print("Welcome");
                    },
                    text: 'الوضع الليلي',
                    imageWidget: Switch(
                      value: true,
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                ], // تغيير كلمة السر
              ),
            ),
            40.verticalSpace,
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
                  20.verticalSpace,
                  CustomListTile(
                    onTap: () {
                      print("Welcome");
                    },
                    text: 'الشروط',
                  ),
                  CustomListTile(
                      onTap: () {
                        print("Welcome");
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
