import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/view/custom_component/exam_statistics/custom_statistics_text.dart';

class CustomCardExamResult extends StatelessWidget {
  final String totalQuestions;
  final String numberWrongAnswer;
  final String numberCorrectAnswer;
  const CustomCardExamResult(
      {super.key,
      required this.numberCorrectAnswer,
      required this.numberWrongAnswer,
      required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              CustomStatisticsText(
                text: 'مجموع الاسئلة',
                numbertext: totalQuestions,
                color: const Color(0xff4996BF),
              ),
              30.verticalSpace,
              CustomStatisticsText(
                text: 'اجابة خاطئة',
                numbertext: numberWrongAnswer,
                color: const Color(0xffFA3939),
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
              CustomStatisticsText(
                text: 'اجابة صحيحة',
                numbertext: numberCorrectAnswer,
                color: const Color(0xff2FD21C),
              ),
            ],
          )
        ],
      ),
    );
  }
}
