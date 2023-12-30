import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/view/custom_component/custom_circular_progress_indicator.dart';
import 'package:quizzy_app/view/custom_component/custom_subject.dart';
import 'package:get/get.dart';
import '../../../view_model/exam/manage_exam_view_model.dart';
import '../../custom_component/custom_search_field.dart';
import '../../custom_component/custom_text.dart';

class ChooseSubject extends GetView<ManageExamViewModel> {
  const ChooseSubject({super.key});

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
            text: "اختر المادة",
            fontFamily: "Cairo",
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            alignment: AlignmentDirectional.topEnd,
          ),
          20.verticalSpace,
          Expanded(
            child: GetBuilder<ManageExamViewModel>(
              builder: (controller) {
                return !controller.isLoadChoicePage
                    ? const CustomCircularProgressIndicator()
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 50.h,
                            crossAxisSpacing: 50.w,
                            crossAxisCount: 2),
                        itemCount: controller.subjectList.length,
                        itemBuilder: (context, index) {
                          return CustomSubject(
                            subjectModel: controller.subjectList[index],
                            onTap: () {
                              controller.chooseSubject(
                                  subjectSelectedId:
                                      controller.subjectList[index].id!);
                            },
                          );
                        });
              },
            ),
          ),
          30.verticalSpace
        ]));
  }
}
