import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quizzy_app/utils/app_images.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 42.h,
                decoration: BoxDecoration(
                    color: Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(8.r)),
                padding: const EdgeInsets.symmetric(horizontal: 12).w,
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      isCollapsed: true,
                      suffixIcon: Image.asset(
                        Assets.imagesSearch,
                        cacheHeight: 17,
                        cacheWidth: 17,
                        color: Color(0xffC6C6C6),
                      ),
                      border: InputBorder.none,
                      hintText: "البحث",
                      hintStyle: TextStyle(
                          fontSize: 16.sp,
                          color: Color(0xffC6C6C6),
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w400),
                      hintTextDirection: TextDirection.rtl),
                  textDirection: TextDirection.rtl,
                ),
              ),
              50.verticalSpace,
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: double.infinity.w,
                    height: 150.h,
                    padding: EdgeInsets.symmetric(horizontal: 8).w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Color(0xff268C6D)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(
                              text: "هل تود استئناف امتحان",
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                            Row(
                              children: [
                                Container(
                                    alignment: AlignmentDirectional.center,
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      color: Colors.white,
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_back,
                                        size: 16.w,
                                        color: Colors.green,
                                      ),
                                      onPressed: () {
                                        print("Good");
                                      },
                                    )),
                                SizedBox(
                                  width: 12,
                                ),
                                CustomText(
                                  text: "التاريخ ؟",
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: -30.h,
                    left: -18.w,
                    child: Image.asset(
                      Assets.imagesStudent,
                      cacheWidth: 150,
                      cacheHeight: 500,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    top: -45.h,
                    left: 125.w,
                    child: Container(
                      padding: EdgeInsets.all(5).h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: CircularPercentIndicator(
                        radius: 35.r,
                        percent: 0.3,
                        backgroundColor: Colors.white,
                        progressColor: Colors.blueAccent,
                        center: CustomText(
                          color: Colors.blue,
                          text: "18",
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              15.verticalSpace,
              CustomText(
                text: "اعلانات وعروض خاصة",
                fontFamily: "Cairo",
                alignment: AlignmentDirectional.topEnd,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
              10.verticalSpace,
              Container(
                alignment: AlignmentDirectional.centerEnd,
                width: double.infinity.w,
                height: 130.h,
                padding: EdgeInsets.only(bottom: 15.h, left: 15.w, right: 15.w),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                        image: AssetImage(Assets.imagesElan),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12.r)),
                child: CustomText(
                  text:
                      " يكتب هنا الإعلان يكتب هنا الإعلان أو العرض يكتب هنا الإعلان أو العرض أو العرض أو العرض يكتب هنا الإعلان أو العرض  ",
                  fontSize: 18.sp,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  textAlign: TextAlign.end,
                ),
              ),
              15.verticalSpace,
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
                    text: "الأعلي تقييم",
                    fontSize: 16.sp,
                    fontFamily: "Cairo",
                  ),
                ],
              ),
              10.verticalSpace,
              Column(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: Color(0xff4490BA)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              Assets.imagesManFace,
                            ))),
                  ),
                  CustomText(
                    text: "الاء سعيد",
                    fontFamily: "Cairo",
                    fontSize: 14.sp,
                  ),
                  Container(
                    width: 60,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        color: Color(0xffFBECFF),
                        borderRadius: BorderRadius.circular(12).r),
                    child: CustomText(
                      text: "203pt",
                      fontSize: 14.sp,
                      fontFamily: "Cairo",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
