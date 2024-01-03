import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/short_long_answer_choice_exam_view_model.dart';

class CustomShortLongChoiceContainer extends GetView<ShortLongAnswerViewModel> {
  final Color color;

  final int? answerUserSelectedID;

  final AnswersModel answersModel; // id User Answer Selected

  const CustomShortLongChoiceContainer({
    super.key,
    required this.answersModel,
    this.answerUserSelectedID,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: 300.w,
            height: 200.h,
            alignment: Alignment.center,
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
            child: TextFormField(
              controller: controller.answerTextController,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                  isCollapsed: true,
                  isDense: true,
                  contentPadding: REdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                  hintText: answersModel.title!,
                  hintStyle: TextStyle(
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  )
                  /*
            CustomText(
              text: answersModel.title!,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
                */
                  ),
            ),
          ),
          // controller.selectedIndex == index
          //     ? const RPadding(
          //         padding: EdgeInsets.all(8.0),
          //         child: Icon(
          //           Icons.check_circle,
          //           color: Colors.white,
          //           size: 30,
          //         ),
          //       )
          //     : const SizedBox(),
          // if (reviewExam)
          //   answerUserSelectedID == id && isCorrect
          //       ? const RPadding(
          //           padding: EdgeInsets.all(8.0),
          //           child: Icon(
          //             Icons.check_circle,
          //             color: Colors.white,
          //             size: 30,
          //           ))
          //       : isCorrect
          //           ? const RPadding(
          //               padding: EdgeInsets.all(8.0),
          //               child: Icon(
          //                 Icons.check_circle,
          //                 color: Colors.white,
          //                 size: 30,
          //               ),
          //             )
          //           : answerUserSelectedID == id
          //               ? const RPadding(
          //                   padding: EdgeInsets.all(8.0),
          //                   child: Icon(
          //                     Icons.cancel_sharp,
          //                     color: Color(0xffcc0000),
          //                     size: 30,
          //                   ),
          //                 )
          //               : const SizedBox()
        ],
      ),
    );
  }
}
