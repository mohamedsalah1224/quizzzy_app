import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/view/custom_component/answer_questions/custom_short_long_choice_container.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';
import 'package:quizzy_app/view_model/exam/exam_type/short_long_answer_choice_exam_view_model.dart';

class LongShortAnswerExam extends GetView<ShortLongAnswerViewModel> {
  const LongShortAnswerExam({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShortLongAnswerViewModel>(
      id: "notUpdateIt",
      builder: (controller) {
        return controller.listAnswersModel.isNotEmpty
            ? CustomShortLongChoiceContainer(
                answersModel: controller.listAnswersModel[0])
            : const Center(
                child: CustomText(text: 'This Question No Have Answers'),
              );
      },
    );
  }
}
