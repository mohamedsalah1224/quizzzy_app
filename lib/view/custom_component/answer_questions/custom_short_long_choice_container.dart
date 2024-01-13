import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/utils/constant/exam_costant.dart';
import 'package:quizzy_app/utils/validation.dart';

class CustomShortLongChoiceContainer extends StatelessWidget {
  final Color color;

  final int? answerUserSelectedID;

  final AnswersModel answersModel; // id User Answer Selected
  final TextEditingController? controllerText;
  final void Function(String)? onFieldSubmitted;
  final int? maxCharLength;

  const CustomShortLongChoiceContainer({
    super.key,
    required this.answersModel,
    required this.controllerText,
    required this.onFieldSubmitted,
    this.maxCharLength,
    this.answerUserSelectedID,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAnswerViewFormatTextImage = answersModel.answerViewFormat ==
        ExamConstatnt.answerViewFormatTextImage;
    final bool isEnglishText = Validation.instance
            .isEnglishText(text: answersModel.answerTwoGapMatch ?? '') ||
        Validation.instance.isEnglishText(text: answersModel.title ?? '');

    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
            width: 300.w,
            height: 200.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: answersModel.answerViewFormat ==
                            ExamConstatnt.answerViewFormatIamge ||
                        isAnswerViewFormatTextImage
                    ? DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          answersModel.photo!,
                        ))
                    : null,
                color: color,
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      offset: Offset(0, 5),
                      spreadRadius: 0,
                      blurRadius: 5,
                      color: Color.fromRGBO(0, 0, 0, 0.25)),
                ],
                borderRadius: BorderRadius.circular(17).r),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: TextFormField(
                controller: controllerText,
                textAlign: TextAlign.center,
                onFieldSubmitted: onFieldSubmitted,
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                validator: maxCharLength != null
                    ? (value) {
                        // eaxh Line Have 50 Charter
                        if (value!.trim().length > maxCharLength!) {
                          return "لابد أن يكون النص عدد حروفه الكلية  $maxCharLength";
                        } else {
                          return null;
                        }
                      }
                    : null,

                textDirection:
                    isEnglishText ? TextDirection.ltr : TextDirection.rtl,
                maxLines: null, // to write the Text in MultiLine

                cursorColor: isAnswerViewFormatTextImage ? Colors.white : null,
                style: TextStyle(
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: isAnswerViewFormatTextImage ? Colors.white : null,
                    overflow: TextOverflow.ellipsis),
                decoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w800,
                      fontSize: 16.sp,
                    ),
                    isCollapsed: true,
                    isDense: true,
                    contentPadding: REdgeInsets.symmetric(horizontal: 10),
                    border: InputBorder.none,
                    hintText: answersModel.title ?? '',
                    hintMaxLines: 5, // to mprevent it in a Single line

                    hintTextDirection:
                        isEnglishText ? TextDirection.ltr : TextDirection.rtl,
                    hintStyle: TextStyle(
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: isAnswerViewFormatTextImage ? Colors.white : null,
                    )),
              ),
            )),
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
    );
  }
}
