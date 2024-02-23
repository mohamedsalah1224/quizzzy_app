import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/model/top_student_dataModel.dart';
import 'package:quizzy_app/utils/validation.dart';
import 'package:quizzy_app/view/custom_component/custom_circular_progress_indicator.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';

class CustomTopStudentPoints extends StatelessWidget {
  final TopStudentDataModel topStudentDataModel;
  const CustomTopStudentPoints({super.key, required this.topStudentDataModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // border: Border.all(
            //     width: 2.r, color: Color(0xff4490BA)),
          ),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: topStudentDataModel.student!.photo ?? "",
            fadeInDuration: const Duration(seconds: 1),
            placeholder: (context, url) =>
                const CustomCircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        CustomText(
          text: topStudentDataModel.student!.username == null
              ? ""
              : topStudentDataModel.student!.username!.length > 11
                  ? "${topStudentDataModel.student!.username!.substring(0, 11)}..."
                  : topStudentDataModel.student!.username.toString(),
          fontFamily: "Cairo",
          textDirection: Validation.instance.isEnglishText(
                  text: topStudentDataModel.student!.username ?? "")
              ? TextDirection.ltr
              : TextDirection.rtl,
          fontSize: 14.sp,
        ),
        2.verticalSpace,
        Container(
          alignment: AlignmentDirectional.center,
          padding: REdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
              color: const Color(0xffFBECFF),
              borderRadius: BorderRadius.circular(12).r),
          child: CustomText(
            text: "${topStudentDataModel.totalEarnedMarks ?? "0"} pt",
            fontSize: 14.sp,
            fontFamily: "Cairo",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
