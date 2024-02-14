import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quizzy_app/view/custom_component/answer_questions/csutom_above_section_of_question.dart';
import 'package:quizzy_app/view/custom_component/custom_alert_message.dart';
import 'package:quizzy_app/view/custom_component/custom_button.dart';
import 'package:quizzy_app/view/custom_component/custom_circular_progress_indicator.dart';
import 'package:quizzy_app/view/screens/exam/exam_type/mange_exam_type.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

import '../../../utils/app_images.dart';
import '../../custom_component/answer_questions/custom_bottom_section_of_question.dart';

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
            text: controller.examTypeMessage,
            fontFamily: "Cairo",
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: Colors.black,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => controller.backFromExamViewPage(),
          ),
        ),
        body: GetBuilder<ManageExamViewModel>(
          id: "LoadExamViewPage",
          builder: (controller) {
            return !controller.isLoadExamViewPage
                ? const CustomCircularProgressIndicator()
                : controller.isNoQuestionExist
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomAlertMessage(
                                text: "لا يوجد لديك اسئلة في هذا الامتحان "),
                          ],
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.h),
                        child: SingleChildScrollView(
                            child: Column(children: [
                          10.verticalSpace,
                          GetBuilder<ManageExamViewModel>(
                            id: "updateLinearProgres",
                            builder: (controller) {
                              return LinearPercentIndicator(
                                percent: controller.countOfQuestion /
                                    controller.totalOfQuestion,
                                lineHeight: 12.h,
                                barRadius: Radius.circular(20),
                                progressColor: Color(0xff268C6D),
                                backgroundColor: Color(0xffEEEEEE),
                              );
                            },
                          ),
                          25.verticalSpace,
// Above Section of the Exam
                          GetBuilder<ManageExamViewModel>(
                            id: "updateAboveSection",
                            builder: (controller) {
                              return CustomAboveSectionOfQuestion(
                                questionsModel:
                                    controller.getCurrentQuestionModel(
                                        index: controller.currentQuetionIndex),
                              );
                            },
                          ),
                          20.verticalSpace,
                          const ManageExamType(),
                          controller.isNoSourceInputForThisQuestion()
                              ? 40.verticalSpace
                              : 25.verticalSpace,
                          // Blew Section
                          GetBuilder<ManageExamViewModel>(
                            id: "updateBlewSection",
                            builder: (controller) {
                              return CustomBottomViewOfQuestion(
                                onPressedSendNote: () {
                                  controller.sendNote();
                                },
                                onTapNextQuestion: () {
                                  controller.nextQuestion();
                                },
                                onTapBackQuestion: () {
                                  controller.backQuestion();
                                },
                                onChanged: (value) {
                                  print(value);
                                  controller.wrongQuetion(
                                      isWrongQuestion: value);
                                },
                              );
                            },
                          ),
                          25.verticalSpace,
                        ])));
          },
        ));
  }
}
