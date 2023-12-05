import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/view_model/auth/register_view_model.dart';
import '../../../utils/app_images.dart';
import '../../custom_component/custom_button.dart';
import '../../custom_component/custom_text.dart';
import '../../custom_component/custom_text_form_field.dart';

class ContinueRegisterView extends GetView<RegisterViewModel> {
  const ContinueRegisterView({super.key});

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
                key: controller.continueRegisterFormKey,
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
                  30.verticalSpace,
                  CustomText(
                    text: 'اسم المستخدم',
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
                      controller: controller.userNameController,
                      validator: (value) =>
                          controller.validateUserName(value: value),
                    ),
                  ),
                  15.verticalSpace,
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
                      controller: controller.passwordController,
                      validator: (value) =>
                          controller.validatePaswword(value: value),
                    ),
                  ),
                  15.verticalSpace,
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
                      controller: controller.passwordConfirmController,
                      validator: (value) =>
                          controller.confirmPasswordValidator(value: value),
                    ),
                  ),
                  50.verticalSpace,
                  CustomButton(
                    text: "تسجيل الدخول",
                    fontFamily: "Poppins",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    onTap: () {
                      controller.logIn();
                    },
                  ),
                  30.verticalSpace,
                ]),
              )),
        ));
  }
}
