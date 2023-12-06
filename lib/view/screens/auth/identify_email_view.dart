import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pinput/pinput.dart';
import 'package:quizzy_app/view_model/auth/identify_email_view_model.dart';
import '../../custom_component/custom_button.dart';
import '../../custom_component/custom_text.dart';

class IdentifyEmailView extends GetView<IdentifyEmailViewModel> {
  const IdentifyEmailView({super.key});

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
              80.verticalSpace,
              Center(
                child: CustomText(
                  text: "من فضلك تأكد من البريد الأكتروني",
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: Color(0xff077C58),
                  alignment: AlignmentDirectional.topEnd,
                ),
              ),
              25.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomText(
                      maxLines: 1,
                      text: "loding600@gmail.com",
                      fontFamily: "Segoe",
                      alignment: AlignmentDirectional.topEnd,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                    ),
                  ),
                  5.horizontalSpace,
                  CustomText(
                    text: "ايميلك هو",
                    fontFamily: "Segoe",
                    alignment: AlignmentDirectional.topEnd,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                  ),
                ],
              ),
              30.verticalSpace,
              Form(
                key: controller.identifyformKey,
                child: Pinput(
                  controller: controller.pinController,
                  focusNode: controller.focusNode,
                  length: 4,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  validator: (value) {
                    return controller.validatePinCode(value);
                  },
                  errorPinTheme: controller.defaultPinTheme.copyWith(
                      decoration: controller.defaultPinTheme.decoration!
                          .copyWith(
                              border: Border.all(color: Colors.redAccent))),
                  defaultPinTheme: controller.defaultPinTheme,
                  focusedPinTheme: controller.defaultPinTheme.copyWith(
                      decoration: controller.defaultPinTheme.decoration!
                          .copyWith(
                              border:
                                  Border.all(color: const Color(0xff268C6D)))),
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "لم يصل لي الكود",
                    fontFamily: "inter",
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                  ),
                  5.horizontalSpace,
                  TextButton(
                    onPressed: () {
                      print("إعادة الارسال");
                    },
                    child: CustomText(
                        text: "اعادة الارسال",
                        fontFamily: "inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Color(0xff268C6D)),
                  ),
                ],
              ),
              50.verticalSpace,
              CustomButton(
                text: "تأكيد",
                onTap: () {
                  controller.confirmEmail();
                },
                fontFamily: "inter",
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              )
            ])));
  }
}
