import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';
import 'package:quizzy_app/view/custom_component/source_type/audio/custom_source_audio.dart';
import 'package:quizzy_app/view/custom_component/source_type/custom_source_image.dart';
import 'package:quizzy_app/view/custom_component/source_type/custom_source_video.dart';
import 'package:quizzy_app/view_model/media/audio_view_model.dart';

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
      print('*' * 50);
      print('File Source Link : $fileSourceLink');
      print('*' * 50);
      // the Link oF Audio is invalid
      if (fileSourceLink == null) {
        return Container(
          width: 300.w,
          height: 130.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xff9FD800),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    offset: Offset(0, 5),
                    spreadRadius: 0,
                    blurRadius: 5,
                    color: Color.fromRGBO(0, 0, 0, 0.25)),
              ],
              borderRadius: BorderRadius.circular(17).r),
          child: CustomText(
            text: "غير قادر علي تحميل الملف الصوتي",
            fontFamily: "Cairo",
            fontSize: 16.sp,
            textDirection: TextDirection.rtl,
          ),
        );
      }
      return ChangeNotifierProvider<AudioViewModel>(
        create: (context) => AudioViewModel(url: fileSourceLink),
        builder: (context, child) {
          // when Each Enter init The Audio Player
          context.read<AudioViewModel>().initObject(fileSourceLink!);
          return Column(
            children: [
              10.verticalSpace,
              const CustomSourceAudio(),
            ],
          );
        },
      );
    }
  }
}
