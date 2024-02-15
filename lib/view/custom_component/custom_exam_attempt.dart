import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quizzy_app/model/exam_attempts_model.dart';
import 'package:quizzy_app/utils/app_images.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';

class CustomExamAttempts extends StatelessWidget {
  final ExamAttemptsDataModel? examAttemptsDataModel;
  final void Function()? onPressed;
  final bool isEmpty;
  final bool showSearchEmpty;

  const CustomExamAttempts(
      {super.key,
      this.examAttemptsDataModel,
      this.isEmpty = false,
      this.showSearchEmpty = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          width: MediaQuery.of(context).size.width * 0.90,
          height: 150.h,
          padding: REdgeInsets.symmetric(horizontal: 8).r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12).r,
              color: const Color(0xff268C6D)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    text: showSearchEmpty
                        ? "لايوجد امتحانات بهذا الإسم"
                        : isEmpty
                            ? "هل تود بدء امتحان"
                            : "هل تود استئناف امتحان",
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                  5.verticalSpace,
                  Row(
                    children: [
                      showSearchEmpty
                          ? const SizedBox()
                          : Container(
                              alignment: AlignmentDirectional.center,
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6).r,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 16.w,
                                  color: Colors.green,
                                ),
                                onPressed: onPressed,
                              )),
                      10.horizontalSpace,
                      CustomText(
                        textDirection: TextDirection.rtl,
                        text: showSearchEmpty
                            ? 'لكي يتم استئنافها'
                            : isEmpty
                                ? "جديد"
                                : examAttemptsDataModel!.subject!.name!.length >
                                        40
                                    ? '${examAttemptsDataModel!.subject!.name!.substring(0, 20)} ....؟'
                                    : "${examAttemptsDataModel!.subject!.name} ؟",
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
          child: SizedBox(
            child: Image.asset(
              Assets.imagesStudent,
              cacheWidth: 150,
              cacheHeight: 500,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Positioned(
          // top: -45.h,
          // left: 125.w,
          // right: 0.0,
          // bottom: 0.0,
          top: -45.0,
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: SizedBox(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(5).h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: Container(
                  // color: Colors.amber,
                  child: CircularPercentIndicator(
                    radius: 35.r,
                    percent: isEmpty
                        ? 0
                        : examAttemptsDataModel!.totalAnsweredQuestions! /
                            examAttemptsDataModel!.totalQuestions!,
                    backgroundColor: Colors.white,
                    progressColor: Colors.blueAccent,
                    center: isEmpty
                        ? Icon(
                            Icons.wb_sunny,
                            size: 30.r,
                            color: primayColor,
                          )
                        : CustomText(
                            color: Colors.blue,
                            text: examAttemptsDataModel!.totalAnsweredQuestions!
                                .toString(),
                            fontWeight: FontWeight.bold,
                            fontSize: examAttemptsDataModel!
                                        .totalAnsweredQuestions!
                                        .toString()
                                        .length >
                                    3
                                ? 20.sp
                                : 25.sp,
                          ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
