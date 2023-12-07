import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                    text: "البريد الإلكتروني/ رقم الهاتف",
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
                      icon: Icons.markunread,
                      hintText:
                          "من فضلك ادخل ايميلك أو رقم هاتفك مسبوقا بكود الدولة",
                      textAlignVertical: TextAlignVertical.bottom,
                      textDirection: TextDirection.ltr,
                      iconColor: Color(0xff268C6D),
                      validator: (value) =>
                          controller.validatePhoneOrEmail(value: value),
                      controller: controller.emailOrPhoneController,
                    ),
                  ),
                  20.verticalSpace,
                  CustomText(
                    text: "المنظقة",
                    fontFamily: "Segoe",
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Color(0xff077C58),
                    alignment: AlignmentDirectional.topEnd,
                  ),
                  3.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: RadioListTile(
                              visualDensity: VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              contentPadding: EdgeInsets.all(0),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: 1,
                              title: CustomText(
                                text: "الضفة الغربية",
                                fontFamily: "inter",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              groupValue: 2,
                              activeColor: Color(0xff268C6D),
                              onChanged: (value) {
                                print(value);
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: RadioListTile(
                              visualDensity: VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              contentPadding: EdgeInsets.all(0),
                              value: 1,
                              title: CustomText(
                                text: "الضفة الغربية",
                                fontFamily: "inter",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              groupValue: 2,
                              activeColor: Color(0xff268C6D),
                              onChanged: (value) {
                                print(value);
                              }),
                        ),
                      ),
                    ],
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
                    init: Get.find<RegisterViewModel>(),
                    builder: (controller) {
                      return CustomDropDownFilter(
                        onChanged: (value) {
                          controller.updateGovernorate(value: value!);
                        },
                        value: controller.governorateValue,
                        defaultValue: "اسم المحافظة",
                        borderColor: Color(0xff268C6D),
                        items: controller.governorateList,
                      );
                    },
                  ),
                  20.verticalSpace,
                  CustomText(
                    text: "منطقة السكن",
                    fontFamily: "Segoe",
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Color(0xff077C58),
                    alignment: AlignmentDirectional.topEnd,
                  ),
                  3.verticalSpace,
                  GetBuilder<RegisterViewModel>(
                    id: "stateOfAreaList",
                    builder: (controller) {
                      print("Rebuild");
                      return CustomDropDownFilter(
                          onChanged: (value) {
                            print(value);
                            controller.updateStateOfAreaList(value: value!);
                          },
                          value: controller.stateOfAreaValue,
                          defaultValue: "منطقة السكن",
                          borderColor: Color(0xff268C6D),
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
                  CustomDropDownFilter(
                      onChanged: (value) {
                        print(value);
                      },
                      value: null,
                      defaultValue: "اسم المنطقة",
                      borderColor: Color(0xff268C6D),
                      items: ['مخيم', "القاهرة"]),
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
                  CustomDropDownFilter(
                      onChanged: (value) {
                        print(value);
                      },
                      value: null,
                      defaultValue: "الصف الدراسي",
                      borderColor: Color(0xff268C6D),
                      items: ['الصف الثاني عشر', "الصف الحادي عشر"]),
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
                  CustomDropDownFilter(
                      onChanged: (value) {
                        print(value);
                      },
                      value: null,
                      defaultValue: "التخصص",
                      borderColor: Color(0xff268C6D),
                      items: ['علمي', "ادبي"]),
                  30.verticalSpace,
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
        ));
  }
}
