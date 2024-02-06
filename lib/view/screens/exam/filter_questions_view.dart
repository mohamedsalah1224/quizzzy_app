import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/view/custom_component/custom_circular_progress_indicator.dart';
import 'package:quizzy_app/view_model/exam/filter_questions_view_model.dart';

import '../../../utils/app_images.dart';
import '../../custom_component/custom_button.dart';
import '../../custom_component/custom_dropdown_filter.dart';
import '../../custom_component/custom_text.dart';

class FilterQuestionsView extends GetView<FilterQuestionsViewModel> {
  const FilterQuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          text: "الإختبار الإختياري",
          fontFamily: "Cairo",
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          color: Colors.black,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controller.backFromFilter();
          },
        ),
      ),
      body: GetBuilder<FilterQuestionsViewModel>(
        id: 'updateLoadFilterPage',
        builder: (controller) {
          return !controller.isLoadFilterPage
              ? const CustomCircularProgressIndicator()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.h),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Center(
                        child: Image.asset(
                          Assets.imagesSubjectFilter,
                          cacheHeight: 200.toInt(),
                          cacheWidth: 201.w.toInt(),
                          fit: BoxFit.fill,
                        ),
                      ),
                      GetBuilder<FilterQuestionsViewModel>(
                        id: 'updateSemester',
                        builder: (controller) {
                          return CustomDropDownFilter(
                            items: controller.semester,
                            value: controller.semesterValue,
                            onChanged: (value) =>
                                controller.updateSemester(value),
                            borderColor: const Color(0xff5BC8FD),
                            defaultValue: "الفصل",
                          );
                        },
                      ),
                      10.verticalSpace,
                      GetBuilder<FilterQuestionsViewModel>(
                        id: "updateUnits",
                        builder: (controller) {
                          return CustomDropDownFilter(
                            items: controller.unitsValueList,
                            value: controller.unitValue,
                            onChanged: (value) {
                              controller.updateUnits(value!);
                            },
                            borderColor: const Color(0xffFF3DC8),
                            defaultValue: "وحدة",
                          );
                        },
                      ),
                      10.verticalSpace,
                      GetBuilder<FilterQuestionsViewModel>(
                        id: "updateLeasons",
                        builder: (controller) {
                          return CustomDropDownFilter(
                            items: controller.leasonsValueList,
                            value: controller.leasonValue,
                            onChanged: (value) {
                              controller.updateLeasons(value!);
                            },
                            borderColor: const Color(0xff9FD800),
                            defaultValue: "الدرس",
                          );
                        },
                      ),
                      10.verticalSpace,
                      GetBuilder<FilterQuestionsViewModel>(
                        id: 'updateTime',
                        builder: (controller) {
                          return CustomDropDownFilter(
                              items: controller.time,
                              value: controller.timeValue,
                              onChanged: (value) =>
                                  controller.updateTime(value),
                              borderColor: const Color(0xffFFC700),
                              defaultValue: '''وقت (دقيقية)''');
                        },
                      ),
                      10.verticalSpace,
                      Container(
                        height: 42.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffFC9A9A),
                              width: 2.r,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r)),
                        padding: const EdgeInsets.symmetric(horizontal: 12).w,
                        child: TextFormField(
                          readOnly: true,
                          onTap: () {
                            print("show Dialog Here");
                          },
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              isCollapsed: true,
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Color(0xff268C6D),
                                    size: 17,
                                  ),
                                ],
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              border: InputBorder.none,
                              hintText: "نوع الاسئلة",
                              hintStyle: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.w400),
                              hintTextDirection: TextDirection.rtl),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      10.verticalSpace,
                      GetBuilder<FilterQuestionsViewModel>(
                        id: 'updateLevelOfExam',
                        builder: (controller) {
                          return CustomDropDownFilter(
                            items: controller.levelOfExam,
                            value: controller.levelofExamValue,
                            onChanged: (value) =>
                                controller.updateLevelOfExam(value),
                            borderColor: const Color(0xffDD90F0),
                            defaultValue: "مستوي الاختبار",
                          );
                        },
                      ),
                      20.verticalSpace,
                      // GetBuilder<FilterQuestionsViewModel>(
                      //   id: "updateEvaluation",
                      //   builder: (controller) {
                      //     return Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         CustomRadioButton(
                      //           groupValue: controller.evaluationGroupValue,
                      //           value: 1,
                      //           text: "التقييم عند الانتهاء",
                      //           onChanged: (value) => controller.updateEvaluation(value!),
                      //         ),
                      //         CustomRadioButton(
                      //           groupValue: controller.evaluationGroupValue,
                      //           value: 2,
                      //           text: "التقييم مباشرة",
                      //           onChanged: (value) => controller.updateEvaluation(value!),
                      //         ),
                      //       ],
                      //     );
                      //   },
                      // ),
                      GetBuilder<FilterQuestionsViewModel>(
                        id: 'updateEvaluation',
                        builder: (controller) {
                          return Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      text: " التقييم عند الانتهاء",
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    4.horizontalSpace,
                                    Radio(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: 1,
                                      groupValue:
                                          controller.evaluationGroupValue,
                                      activeColor: const Color(0xff268C6D),
                                      onChanged: (value) =>
                                          controller.updateEvaluation(value!),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: "التقييم مباشرة",
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    4.horizontalSpace,
                                    Radio(
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: 2,
                                      groupValue:
                                          controller.evaluationGroupValue,
                                      activeColor: const Color(0xff268C6D),
                                      onChanged: (value) =>
                                          controller.updateEvaluation(value!),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      20.verticalSpace,
                      CustomButton(
                        text: "التالي",
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        onTap: () {
                          controller.confirmFilter(context);
                        },
                      ),
                      50.verticalSpace,
                    ]),
                  ));
        },
      ),
    );
  }
}
