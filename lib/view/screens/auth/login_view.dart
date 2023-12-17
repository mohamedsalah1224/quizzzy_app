import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/utils/app_images.dart';
import 'package:quizzy_app/view/custom_component/custom_text_form_field.dart';
import 'package:quizzy_app/view_model/auth/login_view_model.dart';

import '../../custom_component/custom_button.dart';
import '../../custom_component/custom_text.dart';

class LoginView extends GetView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.h),
        child: SingleChildScrollView(
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    Assets.imagesLogoImage,
                    cacheHeight: 132,
                    cacheWidth: 132,
                  ),
                ),
                CustomText(
                  text: "اهلا بعودتك عزيزي الطالب",
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  color: Color(0xff077C58),
                ),
                CustomText(
                  text: "${controller.initViewModel}من فضلك سجل الدخول",
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  color: Color(0xff077C58),
                ),
                40.verticalSpace,
                // Text(controller.initViewModel),
                CustomText(
                  text: "البريد الإلكتروني/ رقم الهاتف",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w700,
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
                  text: "كلمة السر",
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: Color(0xff077C58),
                  alignment: AlignmentDirectional.topEnd,
                ),
                5.verticalSpace,
                SizedBox(
                  height: 52.h,
                  width: double.infinity.w,
                  child: CustomTextFormField(
                    icon: null,
                    eyes: true,
                    textDirection: TextDirection.ltr,
                    obscureText: true,
                    validator: (value) =>
                        controller.validatePasword(value: value),
                    controller: controller.passwordController,
                  ),
                ),
                5.verticalSpace,
                TextButton(
                  onPressed: () {
                    controller.forgetPassword();
                  },
                  child: CustomText(
                    text: "نسيت كلمة السر؟",
                    fontFamily: "Segoe",
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                    color: Color(0xff414141),
                    alignment: AlignmentDirectional.topEnd,
                  ),
                ),
                25.verticalSpace,
                CustomButton(
                  text: "تسجيل الدخول",
                  fontFamily: "Poppins",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    print('سجل دخولك');
                    controller.loginButton();
                  },
                ),
                25.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xff949494),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15).w,
                      child: CustomText(
                        text: "او عن طريق",
                        fontFamily: "Poppins",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Color(0xff949494),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                SizedBox(
                  width: 145.w,
                  height: 50.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            Assets.imagesGoogle,
                            cacheHeight: 30,
                            cacheWidth: 30,
                          ),
                          onPressed: () {
                            print("Sign in with a Google");
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.apple_outlined,
                            size: 25,
                          ),
                          onPressed: () {
                            print("Sign in with a Apple");
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.facebook,
                            size: 25,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            print("Sign in with a Facebook");
                          },
                        ),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.createAccount();
                        print("إنشاء حساب");
                      },
                      child: CustomText(
                        text: " انشاء حساب",
                        fontFamily: "Segoe",
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                        color: Color(0xff178462),
                        alignment: AlignmentDirectional.topEnd,
                      ),
                    ),
                    3.horizontalSpace,
                    CustomText(
                      text: "ليس لديك حساب بالفعل؟",
                      fontFamily: "Segoe",
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                      color: Color(0xff000000),
                      alignment: AlignmentDirectional.topEnd,
                    ),
                  ],
                ),
                15.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
