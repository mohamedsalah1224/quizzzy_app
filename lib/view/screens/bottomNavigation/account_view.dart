import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/utils/app_images.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../../custom_component/custom_achievement.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            Assets.imagesMenu,
            color: Colors.black,
          ),
          onPressed: () {
            print("Ok");
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              Assets.imagesNotification,
              color: Colors.black,
            ),
            onPressed: () {
              print("Ok");
            },
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.h),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17).r,
                    color: Color(0x40D9D9D9),
                    border: Border.all(
                      color: Color(0xffD9D9D9),
                    )),
                child: Column(
                  children: [
                    CustomText(
                      text: "مجموع نقاطك هذا الاسبوع في الجبر",
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                    Divider(),
                    SfCartesianChart(
                        title: ChartTitle(text: 'Flutter Chart'),
                        legend: Legend(isVisible: true),
                        tooltipBehavior: TooltipBehavior(enable: true))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 111.w,
                    height: 26.h,
                    padding: EdgeInsets.symmetric(horizontal: 10).w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff9ADFEF), width: 2),
                        borderRadius: BorderRadius.circular(14)),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButton(
                        underline: Text(""),
                        value: "الجبر",
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            value: "الجبر",
                            child: Text("الجبر"),
                          )
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  CustomText(
                    text: "إنجازاتك",
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                ],
              ),
              15.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAchievement(
                    text: "سؤال",
                    number: 200,
                    assetImage: Assets.imagesCorrectansswer,
                  ),
                  CustomAchievement(
                    text: "نقطة",
                    number: 1000,
                    assetImage: Assets.imagesPoints,
                  ),
                ],
              ),
              25.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAchievement(
                    text: "النجاح",
                    number: 130,
                    assetImage: Assets.imagesFire,
                  ),
                  CustomAchievement(
                    text: "من الأوائل",
                    number: 11,
                    assetImage: Assets.imagesMedal,
                  ),
                ],
              )
            ],
          ))),
    );
  }
}
