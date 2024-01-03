import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/view_model/exam/exam_type/true_false_exam_view_model.dart';

import '../custom_text.dart';

class CustomTrueFalseChoice extends GetView<TrueFalseExamViewModel> {
  final String title;
  final Color color;
  final String? photo;
  final bool isCorrect;
  final int? answerUserSelectedID; // id User Answer Selected
  final int id;
  final bool reviewExam;
  final int index;

  const CustomTrueFalseChoice({
    super.key,
    required this.title,
    required this.id,
    required this.isCorrect,
    this.reviewExam = false,
    required this.index,
    this.photo,
    this.answerUserSelectedID,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: reviewExam
          ? null
          : () {
              controller.onTap(idAnswerValue: id, index: index);
            },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: 144.w,
            height: 200.h, //90
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                //rgba(0, 0, 0, 0.25)
                color: color,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset(0, 5),
                      spreadRadius: 0,
                      blurRadius: 5,
                      color: Color.fromRGBO(0, 0, 0, 0.25)),
                ],
                borderRadius: BorderRadius.circular(17).r),
            child: CustomText(
              text: title,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
          controller.selectedIndex == index
              ? const RPadding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              : const SizedBox(),
          if (reviewExam)
            answerUserSelectedID == id && isCorrect
                ? const RPadding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 30,
                    ))
                : isCorrect
                    ? const RPadding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    : answerUserSelectedID == id
                        ? const RPadding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.cancel_sharp,
                              color: Color(0xffcc0000),
                              size: 30,
                            ),
                          )
                        : const SizedBox()
        ],
      ),
    );
  }
}
