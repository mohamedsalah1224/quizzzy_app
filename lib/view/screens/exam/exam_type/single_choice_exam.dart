import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/view/custom_component/answer_questions/custom_single_choice_container.dart';
import 'package:quizzy_app/view_model/exam/exam_type/single_choice_exam_view_model.dart';

class SingleChoiceExam extends GetView<SingleChoiceExamViewModel> {
  const SingleChoiceExam({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleChoiceExamViewModel>(
        id: "SingleChoiceComponent",
        builder: (controller) {
          return Wrap(
              alignment: WrapAlignment.start,
              spacing: 20.r,
              runSpacing: 20.r,
              children: List.generate(
                controller.listAnswersModel.length,
                (index) => CustomSingleChoiceContainer(
                  index: index,
                  color: const Color(0xff9FD800),
                  title: controller.listAnswersModel[index].title!,
                  id: controller.listAnswersModel[index].id!,
                  isCorrect: controller.listAnswersModel[index].isCorrect!,
                  photo: controller.listAnswersModel[index].photo,
                ),
              ));
        });
  }
}
