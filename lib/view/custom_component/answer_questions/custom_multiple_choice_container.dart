import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/view_model/exam/exam_type/multiple_choice_exam_view_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/single_choice_exam_view_model.dart';

import '../custom_text.dart';

// ignore: must_be_immutable
class CustomMultipleChoiceContainer
    extends GetView<MultipleChoiceExamViewModel> {
  final String title;
  final Color color;
  final String? photo;
  final bool isCorrect;
  final int? answerUserSelectedID; // id User Answer Selected
  final int id;
  final bool reviewExam;
  bool isActive;

  CustomMultipleChoiceContainer({
    super.key,
    required this.title,
    this.isActive = false,
    required this.id,
    required this.isCorrect,
    this.reviewExam = false,
    this.photo,
    this.answerUserSelectedID,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MultipleChoiceExamViewModel>(
      id: "MultipleChoice $id",
      builder: (controller) {
        return GestureDetector(
          onTap: reviewExam
              ? null
              : () {
                  isActive = !isActive;
                  controller.onTap(idAnswer: id, value: isActive);
                },
          child: Stack(alignment: AlignmentDirectional.topEnd, children: [
            Container(
              width: 144.w,
              height: 90.h,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  //rgba(0, 0, 0, 0.25)
                  color: color,
                  boxShadow: const <BoxShadow>[
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
            isActive
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
                  ? RPadding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 30,
                      ),
                    )
                  : answerUserSelectedID == id && !isCorrect
                      ? const RPadding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.cancel_sharp,
                            color: Color(0xffcc0000),
                            size: 30,
                          ),
                        )
                      : answerUserSelectedID == null && isCorrect
                          ? const RPadding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.check_circle,
                                color: Color(0xffcc0000),
                                size: 30,
                              ),
                            )
                          : const SizedBox()
          ]),
        );
      },
    );
  }
}
