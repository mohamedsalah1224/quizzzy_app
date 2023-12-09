import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'package:quizzy_app/view/custom_component/custom_button.dart';
import 'package:quizzy_app/view/custom_component/custom_dropdown_filter.dart';
import 'package:quizzy_app/view/custom_component/custom_radio_button.dart';
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
        body: GetBuilder<RegisterViewModel>(
          id: "loading",
          builder: (controller) {
            return controller.isLoading
                ? SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.h),
                        child: Form(
                          key: controller.registerFormKey,
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
                            15.verticalSpace,
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
                                validator: (value) =>
                                    controller.validateName(value: value),
                                controller: controller.nameController,
                              ),
                            ),
                            15.verticalSpace,
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
                                validator: (value) =>
                                    controller.validateBirthDate(value: value),
                                onTap: () async {
                                  await controller.showDate(context);
                                },
                              ),
                            ),
                            15.verticalSpace,
                            CustomText(
                              text: controller.isSocial
                                  ? "رقم الهاتف"
                                  : "البريد الإلكتروني/ رقم الهاتف",
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
                                icon: controller.isSocial
                                    ? Icons.phone
                                    : Icons.markunread,
                                hintText: controller.isSocial
                                    ? "من فضلك ادخل رقم هاتفك"
                                    : "من فضلك ادخل ايميلك أو رقم هاتفك",
                                textAlignVertical: TextAlignVertical.bottom,
                                textDirection: TextDirection.ltr,
                                iconColor: Color(0xff268C6D),
                                validator: (value) => controller
                                    .validatePhoneOrEmail(value: value),
                                controller: controller.emailOrPhoneController,
                              ),
                            ),
                            20.verticalSpace,
                            CustomText(
                              text: "المنظقة",
                              fontFamily: "Segoe",
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: const Color(0xff077C58),
                              alignment: AlignmentDirectional.topEnd,
                            ),
                            3.verticalSpace,
                            GetBuilder<RegisterViewModel>(
                              id: "regionRadioButton",
                              builder: (controller) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomRadioButton(
                                      groupValue: controller.groupValue,
                                      value: 1,
                                      text: "قطاع غزة",
                                      onChanged: (value) {
                                        controller.updateRadioButton(
                                            value: value!);
                                      },
                                    ),
                                    CustomRadioButton(
                                      groupValue: controller.groupValue,
                                      value: 2,
                                      text: "الضفة الغربية",
                                      onChanged: (value) {
                                        controller.updateRadioButton(
                                            value: value!);
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                            20.verticalSpace,
                            CustomText(
                              text: "المحافظة",
                              fontFamily: "Segoe",
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Color(0xff077C58),
                              alignment: AlignmentDirectional.topEnd,
                            ),
                            3.verticalSpace,
                            GetBuilder<RegisterViewModel>(
                              id: "governorate",
                              builder: (controller) {
                                return CustomDropDownFilter(
                                  onChanged: (value) {
                                    controller.updateGovernorate(value: value!);
                                  },
                                  value: controller.governorateValue,
                                  defaultValue: "اسم المحافظة",
                                  borderColor: Color(0xff268C6D),
                                  items: controller.governorateListValue,
                                );
                              },
                            ),
                            20.verticalSpace,
                            CustomText(
                              text: "منطقة السكن",
                              fontFamily: "Segoe",
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: const Color(0xff077C58),
                              alignment: AlignmentDirectional.topEnd,
                            ),
                            3.verticalSpace,
                            GetBuilder<RegisterViewModel>(
                              id: "stateOfArea",
                              builder: (controller) {
                                return CustomDropDownFilter(
                                    onChanged: (value) {
                                      controller.updateStateOfAreaList(
                                          value: value!);
                                    },
                                    value: controller.stateOfAreaValue,
                                    defaultValue: "منطقة السكن",
                                    borderColor: const Color(0xff268C6D),
                                    items: controller.stateOfAreaList);
                              },
                            ),
                            15.verticalSpace,
                            CustomText(
                              text: "اسم المنطقة",
                              fontFamily: "Segoe",
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Color(0xff077C58),
                              alignment: AlignmentDirectional.topEnd,
                            ),
                            3.verticalSpace,
                            GetBuilder<RegisterViewModel>(
                                id: 'areaName',
                                builder: (controller) {
                                  return CustomDropDownFilter(
                                      onChanged: (value) {
                                        controller.updateAreaName(
                                            value: value!);
                                      },
                                      value: controller.areaName,
                                      defaultValue: "اسم المنطقة",
                                      borderColor: const Color(0xff268C6D),
                                      items: controller.areaNameList);
                                }),
                            15.verticalSpace,
                            CustomText(
                              text: "الصف الدراسي",
                              fontFamily: "Segoe",
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Color(0xff077C58),
                              alignment: AlignmentDirectional.topEnd,
                            ),
                            3.verticalSpace,
                            GetBuilder<RegisterViewModel>(
                              id: "academicYear",
                              builder: (controller) {
                                return CustomDropDownFilter(
                                    onChanged: (value) {
                                      print(value);
                                      controller.updateAcademicYear(
                                          value: value!);
                                    },
                                    value: controller.academicYearValue,
                                    defaultValue: "الصف الدراسي",
                                    borderColor: const Color(0xff268C6D),
                                    items: controller.academicYearListDropDown);
                              },
                            ),
                            15.verticalSpace,
                            CustomText(
                              text: "التخصص",
                              fontFamily: "Segoe",
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Color(0xff077C58),
                              alignment: AlignmentDirectional.topEnd,
                            ),
                            3.verticalSpace,
                            GetBuilder<RegisterViewModel>(
                              id: "specialization",
                              builder: (controller) {
                                return CustomDropDownFilter(
                                    onChanged: (value) {
                                      controller.updateSpecialization(
                                          value: value!);
                                    },
                                    value: controller.specializationValue,
                                    defaultValue: "التخصص",
                                    borderColor: const Color(0xff268C6D),
                                    items: controller.specializationList);
                              },
                            ),
                            15.verticalSpace,
                            GetBuilder<RegisterViewModel>(
                              id: "visibility",
                              builder: (controller) {
                                return Visibility(
                                  visible: controller.isVisibilityErroMessage,
                                  child: CustomText(
                                    text: "من فضلك ادخل جميع  الحقول",
                                    alignment: Alignment.centerRight,
                                    fontSize: 15.sp,
                                    color: Color(0xffcc0000),
                                    fontFamily: "inter",
                                  ),
                                );
                              },
                            ),
                            15.verticalSpace,
                            CustomButton(
                              text: "استمرار",
                              fontFamily: "Poppins",
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              onTap: () {
                                controller.continueregisterView();
                              },
                            ),
                            30.verticalSpace,
                          ]),
                        )),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: primayColor,
                    ),
                  );
          },
        ));
  }
}
