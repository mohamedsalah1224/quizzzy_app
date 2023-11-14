import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_images.dart';
import '../../../utils/constant.dart';
import '../custom_classification.dart';
import '../custom_text.dart';
import 'custom_question_source_type.dart';

class CustomAboveSectionOfQuestion extends StatelessWidget {
  const CustomAboveSectionOfQuestion({
    super.key,
    required this.examName,
    required this.points,
    required this.level,
    required this.time,
    required this.questionSourceType,
    this.questionSourceLink = "",
  });

  final String examName;
  final int points;
  final String level;
  final int time;
  final QuestionSourceType questionSourceType;
  final String questionSourceLink;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomQuestionSourceType(
          questionSourceType: QuestionSourceType.image,
          questionSourceLink: questionSourceLink,
        ),
        10.verticalSpace,
        CustomText(
          text: examName,
          fontFamily: "Cairo",
          fontSize: 16.sp,
        ),
        25.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomClassification(
              text: level,
            ),
            CustomClassification(
              text: '$points نقطة',
            ),
            CustomClassification(
              text: '$time ثواني',
            ),
          ],
        ),
      ],
    );
  }
}
