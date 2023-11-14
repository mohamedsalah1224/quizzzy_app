import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_images.dart';
import '../../../view_model/exam/manage_exam_view_model.dart';
import '../../custom_component/custom_search_field.dart';
import '../../custom_component/custom_subject.dart';
import '../../custom_component/custom_text.dart';

class ChooseSubject extends GetView<ManageExamViewModel> {
  const ChooseSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.h),
        child: SingleChildScrollView(
          child: Column(children: [
            const CustomSearchField(
              text: "البحث",
            ),
            25.verticalSpace,
            CustomText(
              text: "اختر المادة",
              fontFamily: "Cairo",
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              alignment: AlignmentDirectional.topEnd,
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    print("الجبر");
                    controller.chooseSubject(subjectSelected: "الجبر");
                  },
                  child: CustomSubject(
                    image: Assets.imagesAlgebra,
                    name: "الجبر",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("فيزياء");
                    controller.chooseSubject(subjectSelected: "فيزياء");
                  },
                  child: CustomSubject(
                    image: Assets.imagesPhysics,
                    name: "الفيزياء",
                    color: Color(0xffFFC700),
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomSubject(
                  image: Assets.imagesGeography,
                  name: "الجفرافيا",
                  color: Color(0xffDD90F0),
                ),
                CustomSubject(
                  image: Assets.imagesEnglish,
                  name: "اللغة الانجليزية",
                  color: Color(0xffA0D800),
                ),
              ],
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomSubject(
                  image: Assets.imagesChemistry,
                  name: "الكمياء",
                  color: Color(0xff5BC8FD),
                ),
                InkWell(
                  onTap: () {
                    print("OK PRINT IT");
                  },
                  child: CustomSubject(
                    image: Assets.imagesHistory,
                    name: "التاريخ",
                    color: Color(0xffFF3DC9),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
