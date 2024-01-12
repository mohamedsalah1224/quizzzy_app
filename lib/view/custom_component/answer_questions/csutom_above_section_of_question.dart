import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/utils/constant/exam_costant.dart';

import '../../../utils/constant.dart';
import '../custom_classification.dart';
import '../custom_text.dart';
import 'custom_question_source_type.dart';

class CustomAboveSectionOfQuestion extends StatelessWidget {
  final QuestionsModel questionsModel;
  const CustomAboveSectionOfQuestion({
    super.key,
    required this.questionsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomQuestionSourceType(
            fileSourceLink: questionsModel.file,
            questionSourceType: questionsModel.fileType == null
                ? questionsModel.photo != null
                    ? QuestionSourceType.image
                    : QuestionSourceType.none
                : questionsModel.fileType == ExamConstatnt.video
                    ? QuestionSourceType.video
                    : QuestionSourceType.sound,
            imageSourceLink: questionsModel.photo),
        10.verticalSpace,
        CustomText(
          text: questionsModel.name!,
          fontFamily: "Cairo",
          fontSize: 16.sp,
        ),
        questionsModel.fileType == null && questionsModel.photo == null
            ? 40.verticalSpace
            : 25.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomClassification(
              text: questionsModel.level ?? "صعب", // لسه تتعدل من Api
            ),
            CustomClassification(
              text: '${questionsModel.points} نقطة',
            ),
            CustomClassification(
              text: '${questionsModel.time} ثواني',
            ),
          ],
        ),
        questionsModel.fileType == null && questionsModel.photo == null
            ? 25.verticalSpace
            : const SizedBox()
      ],
    );
  }
}
