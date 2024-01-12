import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/view/custom_component/source_type/custom_source_audio.dart';
import 'package:quizzy_app/view/custom_component/source_type/custom_source_image.dart';
import 'package:quizzy_app/view/custom_component/source_type/custom_source_video.dart';

class CustomQuestionSourceType extends StatelessWidget {
  final QuestionSourceType questionSourceType;
  final String? imageSourceLink;
  final String? fileSourceLink;
  const CustomQuestionSourceType(
      {super.key,
      required this.questionSourceType,
      this.fileSourceLink,
      this.imageSourceLink = ""});

  @override
  Widget build(BuildContext context) {
    if (questionSourceType == QuestionSourceType.none) {
      return 50.verticalSpace;
    } else if (questionSourceType == QuestionSourceType.image) {
      return CustomSourceImage(imageSourceLink: imageSourceLink);
    } else if (questionSourceType == QuestionSourceType.video) {
      return CustomSourceVideo(
        fileSourceLink: fileSourceLink,
      );
    } else {
      return CustomSourceAudio(
        fileSourceLink: fileSourceLink,
      );
    }
  }
}
