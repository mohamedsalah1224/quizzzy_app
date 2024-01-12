import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/utils/constant/exam_costant.dart';
import 'package:quizzy_app/view_model/exam/exam_type/single_choice_exam_view_model.dart';

import '../custom_text.dart';

class CustomSingleChoiceContainer extends StatelessWidget {
  final Color? color;
  final int? answerUserSelectedID; // id User Answer Selected
  final bool reviewExam;
  final int index;
  final AnswersModel answerModel;

  const CustomSingleChoiceContainer(
      {super.key,
      this.reviewExam = false,
      required this.index,
      this.answerUserSelectedID,
      this.color = Colors.amber,
      required this.answerModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: reviewExam
          ? null
          : () {
              context
                  .read<SingleChoiceExamViewModel>()
                  .onTap(idAnswerValue: answerModel.id!, index: index);
            },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: 144.w,
            height: 90.h,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                //rgba(0, 0, 0, 0.25)
                color: color,
                image: answerModel.answerViewFormat ==
                            ExamConstatnt.answerViewFormatIamge ||
                        answerModel.answerViewFormat ==
                            ExamConstatnt.answerViewFormatTextImage
                    ? DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          answerModel.photo!,
                        ))
                    : null,
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      offset: Offset(0, 5),
                      spreadRadius: 0,
                      blurRadius: 5,
                      color: Color.fromRGBO(0, 0, 0, 0.25)),
                ],
                borderRadius: BorderRadius.circular(17).r),
            child: answerModel.answerViewFormat ==
                        ExamConstatnt.answerViewFormatText ||
                    answerModel.answerViewFormat ==
                        ExamConstatnt.answerViewFormatTextImage
                ? CustomText(
                    text: answerModel.title ?? "",
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: answerModel.answerViewFormat ==
                            ExamConstatnt.answerViewFormatTextImage
                        ? Colors.white
                        : null,
                  )
                : const SizedBox(),
          ),
          context.read<SingleChoiceExamViewModel>().selectedIndex == index
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
            answerUserSelectedID == answerModel.id && answerModel.isCorrect!
                ? const RPadding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 30,
                    ))
                : answerModel.isCorrect!
                    ? const RPadding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    : answerUserSelectedID == answerModel.id!
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
