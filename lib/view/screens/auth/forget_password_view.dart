import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pinput/pinput.dart';

import '../../../view_model/auth/forget_password_view_model.dart';
import '../../custom_component/custom_button.dart';
import '../../custom_component/custom_text.dart';
import '../../custom_component/custom_text_form_field.dart';

class ForgetPasswordView extends GetView<ForgetPasswordViewModel> {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.h),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              50.verticalSpace,
              Center(
                child: CustomText(
                  text: "نسيت كلمة المرور؟",
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: Color(0xff077C58),
                ),
              ),
              30.verticalSpace,
              CustomText(
                text:
                    "لا تقلق سوف تسترد حسابك في اقرب وقت \n فقط اتبع الخطوات التالية",
                fontFamily: "Segoe",
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Color.fromRGBO(0, 0, 0, 0.7),
                textAlign: TextAlign.end,
              ),
              30.verticalSpace,
              CustomText(
                text: "البريد الإلكتروني",
                fontFamily: "Segoe",
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: Color(0xff077C58),
                alignment: AlignmentDirectional.topEnd,
              ),
              5.verticalSpace,
              SizedBox(
                height: 52.h,
                width: double.infinity.w,
                child: CustomTextFormField(
                  icon: Icons.markunread,
                  iconColor: Color(0xff268C6D),
                  controller: controller.emailController,
                ),
              ),
              30.verticalSpace,
              CustomButton(
                text: "ارسال",
                onTap: () {
                  controller.send();
                },
                fontFamily: "inter",
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              )
            ])));
  }
}
