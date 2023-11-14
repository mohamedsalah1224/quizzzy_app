import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_images.dart';
import '../../../view_model/exam/manage_exam_view_model.dart';
import '../../custom_component/custom_button.dart';
import '../../custom_component/custom_dropdown_filter.dart';
import '../../custom_component/custom_text.dart';

class FilterQuestionsView extends GetView<ManageExamViewModel> {
  const FilterQuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            CustomDropDownFilter(
              items: ["الأول", "الثاني"],
              value: null,
              onChanged: (value) {
                print(value);
              },
              borderColor: const Color(0xff5BC8FD),
              defaultValue: "الفصل",
            ),
            10.verticalSpace,
            CustomDropDownFilter(
              items: ["الأولي", "الثانية", "الثالثة"],
              value: null,
              onChanged: (value) {
                print(value);
              },
              borderColor: const Color(0xffFF3DC8),
              defaultValue: "وحدة",
            ),
            10.verticalSpace,
            CustomDropDownFilter(
              items: ["الأول", "الثاني", "الثالث"],
              value: null,
              onChanged: (value) {
                print(value);
              },
              borderColor: const Color(0xff9FD800),
              defaultValue: "الدرس",
            ),
            10.verticalSpace,
            CustomDropDownFilter(
                items: [
                  "5",
                  "10",
                  "30",
                ],
                value: null,
                onChanged: (value) {
                  print(value);
                },
                borderColor: const Color(0xffFFC700),
                defaultValue: '''وقت (دقيقية)'''),
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
            CustomDropDownFilter(
              items: [
                "سهل",
                "متوسط",
                "صعب",
              ],
              value: null,
              onChanged: (value) {
                print(value);
              },
              borderColor: const Color(0xffDD90F0),
              defaultValue: "مستوي الاختبار",
            ),
            20.verticalSpace,
            Container(
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
                          visualDensity: VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: 1,
                          groupValue: 1,
                          activeColor: Color(0xff268C6D),
                          onChanged: (value) {
                            print(value);
                          })
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
                          visualDensity: VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: 1,
                          groupValue: 2,
                          activeColor: Color(0xff268C6D),
                          onChanged: (value) {
                            print(value);
                          })
                    ],
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            CustomButton(
              text: "التالي",
              fontFamily: "Cairo",
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              onTap: () {
                print("التالي");
                controller.confirmFilter();
              },
            ),
            50.verticalSpace,
          ]),
        ));
  }
}
