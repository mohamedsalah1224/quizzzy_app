import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/view/custom_component/custom_circular_progress_indicator.dart';

class CustomQuestionSourceType extends StatelessWidget {
  final QuestionSourceType questionSourceType;
  final String? questionSourceLink;
  const CustomQuestionSourceType(
      {super.key,
      required this.questionSourceType,
      this.questionSourceLink = ""});

  @override
  Widget build(BuildContext context) {
    if (questionSourceType == QuestionSourceType.none) {
      return 50.verticalSpace;
    } else if (questionSourceType == QuestionSourceType.image)
      return CachedNetworkImage(
        fit: BoxFit.fitHeight,
        width: double.infinity.w,
        height: 127.h,
        imageUrl: questionSourceLink ?? "",
        fadeInDuration: const Duration(seconds: 1),
        placeholder: (context, url) => const CustomCircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    else if (questionSourceType == QuestionSourceType.video)
      return Text("Video");
    else
      return Text("Sound");
  }
}
