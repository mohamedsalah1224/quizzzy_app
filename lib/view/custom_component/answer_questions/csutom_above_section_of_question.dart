import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/model/questions_model.dart';

import '../../../utils/constant.dart';
import '../custom_classification.dart';
import '../custom_text.dart';
import 'custom_question_source_type.dart';

class CustomAboveSectionOfQuestion extends StatelessWidget {
  final QuestionsModel questionsModel;
  const CustomAboveSectionOfQuestion({
    super.key,
    required this.questionsModel,
    required this.level,
  });

  final String level;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomQuestionSourceType(
            questionSourceType: questionsModel.photo != null
                ? QuestionSourceType.image
                : QuestionSourceType.video,
            questionSourceLink: questionsModel.photo!),
        10.verticalSpace,
        CustomText(
          text: questionsModel.name!,
          fontFamily: "Cairo",
          fontSize: 16.sp,
        ),
        25.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomClassification(
              text: "صعب", // لسه تتعدل من Api
            ),
            CustomClassification(
              text: '${questionsModel.points} نقطة',
            ),
            CustomClassification(
              text: '${questionsModel.time} ثواني',
            ),
          ],
        ),
      ],
    );
  }
}
