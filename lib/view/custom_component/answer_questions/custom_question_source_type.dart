import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/utils/constant.dart';

class CustomQuestionSourceType extends StatelessWidget {
  final QuestionSourceType questionSourceType;
  final String questionSourceLink;
  const CustomQuestionSourceType(
      {super.key,
      required this.questionSourceType,
      this.questionSourceLink = ""});

  @override
  Widget build(BuildContext context) {
    if (questionSourceType == QuestionSourceType.none)
      return const SizedBox();
    else if (questionSourceType == QuestionSourceType.image)
      return Image.asset(
        questionSourceLink,
        height: 127.h,
        fit: BoxFit.fitHeight,
        width: double.infinity.w,
      );
    else if (questionSourceType == QuestionSourceType.video)
      return Text("Vide");
    else
      return Text("Sound");
  }
}
