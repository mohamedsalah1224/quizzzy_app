import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/utils/app_images.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';
import 'package:quizzy_app/view/custom_component/exam_statistics/custom_statistics_icon.dart';
import 'package:quizzy_app/view/custom_component/exam_statistics/custom_statistics_text.dart';

class ExamStatisticsView extends StatelessWidget {
  const ExamStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30).r,
                    color: const Color(0xff268C6D),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: REdgeInsets.only(bottom: 35),
                        decoration: BoxDecoration(
                          // rgba(255, 255, 255, 0.25)

                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.25),
                              // strokeAlign: ,

                              width: 20),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 150.w,
                          height: 150.w,
                          decoration: BoxDecoration(
                              // rgba(255, 255, 255, 0.25)
                              border: Border.all(
                                  color: Color.fromRGBO(
                                      0, 167, 50, 0.20), // inside first
                                  // strokeAlign: ,

                                  width: 15),
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: 'مجموع نقاطك',
                                fontFamily: 'Cairo',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff268C6D),
                              ),
                              CustomText(
                                text: '100 pt',
                                fontFamily: 'DMSans',
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff268C6D),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      const Expanded(child: SizedBox()),
                      50.verticalSpace,
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CustomStatisticsIcon(
                                    text: 'اعادة الاختبار',
                                    color: Color(0xff40C2E0),
                                    cacheHeight: 21,
                                    cacheWidth: 21,
                                    iconAssetPath: Assets.repetitionStatistics,
                                  ),
                                  30.verticalSpace,
                                  const CustomStatisticsIcon(
                                    text: 'تحويلها pdf',
                                    color: Color(0xff37AFA1),
                                    cacheHeight: 18,
                                    cacheWidth: 24,
                                    iconAssetPath: Assets.convertPdfStatistics,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CustomStatisticsIcon(
                                    text: 'مشاركة',
                                    color: Color(0xff6680DB),
                                    cacheHeight: 22,
                                    cacheWidth: 21,
                                    iconAssetPath: Assets.shareStatistics,
                                  ),
                                  30.verticalSpace,
                                  const CustomStatisticsIcon(
                                    text: 'مراجعة الاجابات',
                                    color: Color(0xffF75959),
                                    cacheHeight: 21,
                                    cacheWidth: 14,
                                    iconAssetPath:
                                        Assets.revisionAnswerStatistics,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CustomStatisticsIcon(
                                    text: 'الرئيسية',
                                    color: Color(0xffAD8AE8),
                                    cacheHeight: 18,
                                    cacheWidth: 24,
                                    iconAssetPath: Assets.homeStatistics,
                                  ),
                                  30.verticalSpace,
                                  const CustomStatisticsIcon(
                                    text: 'الاعلي نقاط',
                                    color: Color(0xff5F6A6E),
                                    cacheHeight: 18,
                                    cacheWidth: 24,
                                    iconAssetPath: Assets.highPointsStatistics,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 305.w,
            height: 250.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(boxShadow: const <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                  blurRadius: 4,
                  color: Color.fromRGBO(0, 0, 0, 0.50)),
            ], borderRadius: BorderRadius.circular(30).r, color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const CustomStatisticsText(
                      text: 'مجموع الاسئلة',
                      numbertext: "20",
                      color: Color(0xff4996BF),
                    ),
                    30.verticalSpace,
                    const CustomStatisticsText(
                      text: 'اجابة خاطئة',
                      numbertext: "07",
                      color: Color(0xffFA3939),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const CustomStatisticsText(
                      text: 'اكتمل الاختبار',
                      numbertext: "100%",
                      color: Color(0xff4996BF),
                    ),
                    30.verticalSpace,
                    const CustomStatisticsText(
                      text: 'اجابة صحيحة',
                      numbertext: "13",
                      color: Color(0xff2FD21C),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
