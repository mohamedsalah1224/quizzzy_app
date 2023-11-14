import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:quizzy_app/view/custom_component/custom_button.dart';
import 'package:quizzy_app/view/custom_component/custom_dropdown_filter.dart';
import 'package:quizzy_app/view/custom_component/custom_text_form_field.dart';
import 'package:quizzy_app/view_model/auth/register_view_model.dart';

import '../../../utils/app_images.dart';
import '../../custom_component/custom_text.dart';

class RegisterView extends GetView<RegisterViewModel> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.h),
              child: Column(children: [
                Center(
                  child: Image.asset(
                    Assets.imagesLogoImage,
                    cacheHeight: 132,
                    cacheWidth: 132,
                  ),
                ),
                CustomText(
                  text: "انشاء الحساب",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Color(0xff077C58),
                ),
                10.verticalSpace,
                CustomText(
                  text: "الاسم رباعي",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Color(0xff077C58),
                  alignment: AlignmentDirectional.topEnd,
                ),
                3.verticalSpace,
                SizedBox(
                  width: double.infinity.w,
                  height: 45.h,
                  child: CustomTextFormField(
                    icon: null,
                  ),
                ),
                10.verticalSpace,
                CustomText(
                  text: "تاريخ الميلاد",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Color(0xff077C58),
                  alignment: AlignmentDirectional.topEnd,
                ),
                3.verticalSpace,
                SizedBox(
                  width: double.infinity.w,
                  height: 45.h,
                  child: CustomTextFormField(
                    icon: Icons.date_range_outlined,
                    iconColor: Color(0xff077C58),
                    readOnly: true,
                    controller: controller.dateController,
                    onTap: () async {
                      await controller.showDate(context);
                    },
                  ),
                ),
                10.verticalSpace,
                CustomText(
                  text: "البريد الإلكتروني",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Color(0xff077C58),
                  alignment: AlignmentDirectional.topEnd,
                ),
                3.verticalSpace,
                SizedBox(
                  width: double.infinity.w,
                  height: 45.h,
                  child: CustomTextFormField(
                    icon: null,
                  ),
                ),
                10.verticalSpace,
                CustomText(
                  text: "المنظقة",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Color(0xff077C58),
                  alignment: AlignmentDirectional.topEnd,
                ),
                3.verticalSpace,
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: "قطاع غزة",
                            fontFamily: "inter",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
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
                            text: "الضفة الغربية",
                            fontFamily: "inter",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
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
                10.verticalSpace,
                CustomText(
                  text: "المحافظة",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Color(0xff077C58),
                  alignment: AlignmentDirectional.topEnd,
                ),
                3.verticalSpace,
                SizedBox(
                  width: double.infinity.w,
                  height: 45.h,
                  child: CustomTextFormField(
                    icon: null,
                  ),
                ),
                10.verticalSpace,
                CustomText(
                  text: "اسم المنطقة",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Color(0xff077C58),
                  alignment: AlignmentDirectional.topEnd,
                ),
                3.verticalSpace,
                CustomDropDownFilter(
                    onChanged: (value) {
                      print(value);
                    },
                    value: null,
                    defaultValue: "اسم المنطقة",
                    borderColor: Color(0xff268C6D),
                    items: ['مخيم', "القاهرة"]),
                10.verticalSpace,
                CustomText(
                  text: "الصف الدراسي",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Color(0xff077C58),
                  alignment: AlignmentDirectional.topEnd,
                ),
                3.verticalSpace,
                CustomDropDownFilter(
                    onChanged: (value) {
                      print(value);
                    },
                    value: null,
                    defaultValue: "الصف الدراسي",
                    borderColor: Color(0xff268C6D),
                    items: ['الصف الثاني عشر', "الصف الحادي عشر"]),
                10.verticalSpace,
                CustomText(
                  text: "التخصص",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Color(0xff077C58),
                  alignment: AlignmentDirectional.topEnd,
                ),
                3.verticalSpace,
                CustomDropDownFilter(
                    onChanged: (value) {
                      print(value);
                    },
                    value: null,
                    defaultValue: "التخصص",
                    borderColor: Color(0xff268C6D),
                    items: ['علمي', "ادبي"]),
                10.verticalSpace,
                CustomText(
                  text: "كلمة السر",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Color(0xff077C58),
                  alignment: AlignmentDirectional.topEnd,
                ),
                3.verticalSpace,
                SizedBox(
                  width: double.infinity.w,
                  height: 45.h,
                  child: CustomTextFormField(
                    icon: null,
                    eyes: true,
                    obscureText: true,
                  ),
                ),
                10.verticalSpace,
                CustomText(
                  text: "تأكيد كلمة السر",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Color(0xff077C58),
                  alignment: AlignmentDirectional.topEnd,
                ),
                3.verticalSpace,
                SizedBox(
                  width: double.infinity.w,
                  height: 45.h,
                  child: CustomTextFormField(
                    icon: null,
                    eyes: true,
                    obscureText: true,
                  ),
                ),
                30.verticalSpace,
                CustomButton(
                  text: "استمرار",
                  fontFamily: "Poppins",
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    controller.continueRegister();
                  },
                ),
                30.verticalSpace,
              ])),
        ));
  }
}
