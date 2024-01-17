import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30).r,
                      color: Colors.green),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ),
            ],
          ),
          Container(
            width: 305.w,
            height: 232.h,
            margin: REdgeInsets.only(top: 70),
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
