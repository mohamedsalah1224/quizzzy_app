// import 'package:get/get.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:quizzy_app/utils/binding/forget_password_binding.dart';
import 'package:quizzy_app/utils/binding/login_binding.dart';
import 'package:quizzy_app/utils/binding/register_binding.dart';
import 'package:quizzy_app/utils/binding/splash_binding.dart';

import 'package:quizzy_app/view/screens/bottomNavigation/mange_bottom_sheet_view.dart';
import 'package:quizzy_app/view/screens/auth/chane_password_view.dart';
import 'package:quizzy_app/view/screens/auth/forget_password_view.dart';
import 'package:quizzy_app/view/screens/auth/identify_email_view.dart';
import 'package:quizzy_app/view/screens/auth/login_view.dart';
import 'package:quizzy_app/view/screens/auth/register_view.dart';
import 'package:quizzy_app/view/screens/auth/sucess_password_changed_view.dart';
import 'package:quizzy_app/view/screens/auth/verify_email_view.dart';
import 'package:quizzy_app/view/screens/exam/exam_view.dart';
import 'package:quizzy_app/view/screens/splash_view.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

import 'binding/bottom_navigation_binding.dart';
import 'binding/sucess_password_changed_binding.dart';

class Routes {
  // OnboardingViewTwo
  static const String initialRoute = "/";
  static const String bottomNavgation = "/bottomNavigation";
  static const String loginView = "/loginView";
  static const String registerView = "/registerView";
  static const String forgetPasswordView = "/forgetPasswordView";
  static const String identifyEmailview = "/identifyEmailview";
  static const String changePasswordView = "/changePasswordView";
  static const String verifyEmailView = "/verifyEmailView";
  static const String sucessPasswordChanged =
      "/sucessPasswordChanged"; // ExamView
  static const String examView = "/examView";
// identify_email_view

  static List<GetPage<dynamic>>? getPages() => [
        GetPage(
            name: initialRoute,
            page: () => const SplashView(),
            binding: SplashBinding()),
        GetPage(
            name: bottomNavgation,
            page: () => const ManageBottomNavigationView(),
            binding: BottomNavigationBinding()),
        GetPage(
            name: loginView,
            page: () => const LoginView(),
            binding: LoginBinding()),
        GetPage(
            name: registerView,
            page: () => const RegisterView(),
            binding: RegisterBinding()),
        GetPage(
            name: forgetPasswordView,
            page: () => const ForgetPasswordView(),
            binding: ForgetPasswordBinding()),
        GetPage(
          name: identifyEmailview,
          page: () => const IdentifyEmailView(),
        ),
        GetPage(
          name: changePasswordView,
          page: () => const ChangePasswordView(),
        ),
        GetPage(
          name: verifyEmailView,
          page: () => const VerifyEmailView(),
        ),
        GetPage(
            name: sucessPasswordChanged,
            page: () => const SucessPasswordChangedView(),
            binding: SucessPasswordChangedBinding()),
        GetPage(
          name: examView,
          page: () => const ExamView(),
        ),
      ];
}
