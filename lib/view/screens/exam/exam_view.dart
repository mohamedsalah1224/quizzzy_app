import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/view/custom_component/answer_questions/csutom_above_section_of_question.dart';
import 'package:quizzy_app/view/custom_component/custom_button.dart';
import 'package:quizzy_app/view/custom_component/custom_text_form_field.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

import '../../../utils/app_images.dart';
import '../../custom_component/answer_questions/custom_bottom_section_of_question.dart';
import '../../custom_component/answer_questions/custom_single_choice_container.dart';
import '../../custom_component/custom_classification.dart';
import '../../custom_component/custom_text.dart';

class ExamView extends GetView<ManageExamViewModel> {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CustomText(
            text: "الاختبارات",
            fontFamily: "Cairo",
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: Colors.black,
          ),
          centerTitle: true,
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
                child: Column(children: [
              10.verticalSpace,
              LinearPercentIndicator(
                percent: 0.8,
                lineHeight: 12.h,
                barRadius: Radius.circular(20),
                progressColor: Color(0xff268C6D),
                backgroundColor: Color(0xffEEEEEE),
              ),
              25.verticalSpace,
// Above Section of the Exam
              CustomAboveSectionOfQuestion(
                  examName: "ما هي عاصمة فلسطين؟",
                  points: 100,
                  level: "صعب",
                  time: 5,
                  questionSourceLink: Assets.imageExam1,
                  questionSourceType: QuestionSourceType.image),
              20.verticalSpace,
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 20.r,
                runSpacing: 20.r,
                children: [
                  CustomSingleChoiceContainer(
                    text: "القاهرة",
                    color: Color(0xffFF3DC8),
                  ),
                  CustomSingleChoiceContainer(
                    text: "القدس",
                    color: Color(0xff5BC8FD),
                  ),
                  CustomSingleChoiceContainer(
                    text: "الجيزة",
                  ),
                  CustomSingleChoiceContainer(
                    text: "غزة",
                    color: Color(0xff9FD800),
                  ),
                ],
              ),
              25.verticalSpace,
              CustomBottomViewOfQuestion(
                onPressedSendNote: () {
                  print("Note");
                },
                onTapNextQuestion: () {
                  print("Next Question");
                },
              ),
              25.verticalSpace,
            ]))));
  }
}
