import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzy_app/utils/constant/exam_costant.dart';
import 'package:quizzy_app/view/custom_component/answer_questions/custom_short_long_choice_container.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';
import 'package:quizzy_app/view_model/exam/exam_type/short_long_answer_choice_exam_provider_view_model.dart';

class LongShortAnswerExam extends StatelessWidget {
  const LongShortAnswerExam({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShortLongAnswerViewModel>(
      create: (context) => ShortLongAnswerViewModel(),
      builder: (context, child) {
        ExamConstatnt.setNewQuestionContext(context);
        return Consumer<ShortLongAnswerViewModel>(
          builder: (context, controller, child) {
            return controller.listAnswersModel.isNotEmpty
                ? CustomShortLongChoiceContainer(
                    answersModel: controller.listAnswersModel[0],
                    controllerText: controller.answerTextController,
                    onFieldSubmitted: (value) {
                      controller.onFieldSubmitted(value);
                    },
                    maxCharLength: 500,
                  )
                : const Center(
                    child: CustomText(text: 'This Question No Have Answers'),
                  );
          },
        );
      },
    );
  }
}
