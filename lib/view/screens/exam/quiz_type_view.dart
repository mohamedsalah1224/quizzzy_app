import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/utils/constant.dart';

import '../../../utils/app_images.dart';
import '../../../view_model/exam/manage_exam_view_model.dart';
import '../../custom_component/custom_search_field.dart';
import '../../custom_component/custom_quiz_type.dart';
import '../../custom_component/custom_text.dart';

class QuizTypeView extends GetView<ManageExamViewModel> {
  const QuizTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.h),
        child: Column(children: [
          const CustomSearchField(
            text: "البحث",
          ),
          25.verticalSpace,
          CustomText(
            text: "نوع الاختبار",
            fontFamily: "Cairo",
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            alignment: AlignmentDirectional.topEnd,
          ),
          50.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomQuizType(
                  imageAssetName: Assets.imagesTeacher,
                  name: "اختبار من مختص",
                  isShowArrow: false,
                  onTap: () {
                    controller.createOtherExam(QuizType.specialist);
                    print("اختبار من مختص");
                  },
                  color: Color(0xffA0D800)),
              CustomQuizType(
                imageAssetName: Assets.imagesChoose,
                name: "اختياري",
                isShowArrow: false,
                color: Color(0xffDD90F0),
                onTap: () {
                  controller.createYourExamByFilter();
                },
              ),
            ],
          ),
          60.verticalSpace,
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            CustomQuizType(
                imageAssetName: Assets.imagesAi,
                isShowArrow: false,
                name: "معالجة الضعف بالذكاء الاصطناعي",
                onTap: () {
                  controller.createOtherExam(QuizType.ai);
                },
                color: Color(0xffFF3DC9)),
            CustomQuizType(
                imageAssetName: Assets.imagesRandom,
                isShowArrow: false,
                name: "بشكل عشوائي",
                onTap: () {
                  controller.createOtherExam(QuizType.random);
                },
                color: Color(0xff5BC8FD)),
          ]),
        ]));
  }
}
