// import 'package:get/get.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:quizzy_app/utils/binding/exam_statistics_binding.dart';
import 'package:quizzy_app/utils/binding/forget_password_binding.dart';
import 'package:quizzy_app/utils/binding/identify_email_binding.dart';
import 'package:quizzy_app/utils/binding/identify_phone_binding.dart';
import 'package:quizzy_app/utils/binding/login_binding.dart';
import 'package:quizzy_app/utils/binding/notification_binding.dart';
import 'package:quizzy_app/utils/binding/questions_type_binding.dart';
import 'package:quizzy_app/utils/binding/register_binding.dart';
import 'package:quizzy_app/utils/binding/balance_binding.dart';
import 'package:quizzy_app/utils/binding/splash_binding.dart';
import 'package:quizzy_app/utils/binding/update_account_binding.dart';
import 'package:quizzy_app/utils/binding/update_change_password_binding.dart';
import 'package:quizzy_app/utils/binding/verify_email_binding.dart';
import 'package:quizzy_app/utils/binding/verify_phone_binding.dart';
import 'package:quizzy_app/view/screens/auth/continue_register_view.dart';
import 'package:quizzy_app/view/screens/auth/identify_phone_view.dart';
import 'package:quizzy_app/view/screens/auth/verify_phone_view.dart';

import 'package:quizzy_app/view/screens/bottomNavigation/mange_bottom_sheet_view.dart';
import 'package:quizzy_app/view/screens/auth/chane_password_view.dart';
import 'package:quizzy_app/view/screens/auth/forget_password_view.dart';
import 'package:quizzy_app/view/screens/auth/identify_email_view.dart';
import 'package:quizzy_app/view/screens/auth/login_view.dart';
import 'package:quizzy_app/view/screens/auth/register_view.dart';
import 'package:quizzy_app/view/screens/auth/sucess_password_changed_view.dart';
import 'package:quizzy_app/view/screens/auth/verify_email_view.dart';
import 'package:quizzy_app/view/screens/exam/exam_statistics_view.dart';
import 'package:quizzy_app/view/screens/exam/exam_view.dart';
import 'package:quizzy_app/view/screens/settings/balance_view.dart';
import 'package:quizzy_app/view/screens/settings/notification_view.dart';
import 'package:quizzy_app/view/screens/settings/settings_view.dart';
import 'package:quizzy_app/view/screens/settings/update_account_view.dart';
import 'package:quizzy_app/view/screens/settings/update_change_password_view.dart';
import 'package:quizzy_app/view/screens/splash_view.dart';
import 'binding/bottom_navigation_binding.dart';
import 'binding/sucess_password_changed_binding.dart';

class Routes {
  // OnboardingViewTwo
  Routes._();
  static const String initialRoute = "/";
  static const String bottomNavgation = "/bottomNavigation";
  static const String loginView = "/loginView";
  static const String registerView = "/registerView";
  static const String forgetPasswordView = "/forgetPasswordView";
  static const String identifyEmailview =
      "/identifyEmailview"; // IdentifyPhoneView
  static const String identifyPhoneview = "/identifyPhoneview";
  static const String changePasswordView = "/changePasswordView";
  static const String verifyEmailView =
      "/verifyEmailView"; // ContinueRegisterView
  static const String verifyPhoneView = "/verifyPhoneView";
  static const String continueRegisterView = "/continueRegisterView";
  static const String sucessPasswordChanged =
      "/sucessPasswordChanged"; // ExamView
  static const String examView = "/examView";

  static const String examStatisticsView = "/examStatisticsView";
// identify_email_view
// VerifyPhoneView

  static const String settingsView = "/settingsView";
  static const String balanceView = "/balanceView";
  static const String updateChangePasswordView = "/updateChangePasswordView";
  static const String updateAccountView = "/updateAccountView";
  static const String notificationView = "/notificationView";
  // NotificationView

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
            binding: ForgetPasswordBinding()), // identifyPhoneview
        GetPage(
            name: identifyEmailview,
            page: () => const IdentifyEmailView(),
            binding: IdentifyEmailBinding()),
        GetPage(
            name: identifyPhoneview,
            page: () => const IdentifyPhoneView(),
            binding: IdentifyPhoneBinding()),
        GetPage(
          name: continueRegisterView,
          page: () => const ContinueRegisterView(),
        ),
        GetPage(
          name: changePasswordView,
          page: () => const ChangePasswordView(),
        ),
        GetPage(
          name: verifyEmailView,
          page: () => const VerifyEmailView(),
          binding: VerifyEmailBinding(),
        ),
        GetPage(
          name: verifyPhoneView,
          page: () => const VerifyPhoneView(),
          binding: VerifyPhoneBinding(),
        ),
        GetPage(
            name: sucessPasswordChanged,
            page: () => const SucessPasswordChangedView(),
            binding: SucessPasswordChangedBinding()),
        GetPage(
            name: examView,
            page: () => const ExamView(),
            binding: QuestionsTypeBinding()),
        GetPage(
            name: examStatisticsView,
            page: () => const ExamStatisticsView(),
            binding: ExamStatisticsBinding()),
        //ExamStatisticsBinding
        GetPage(
            name: settingsView,
            page: () => const SettingsView(),
            binding: BottomNavigationBinding()),
        GetPage(
          name: balanceView,
          page: () => const BalanceView(),
          binding: BalanceBinding(),
        ),
        GetPage(
          name: updateChangePasswordView,
          page: () => const UpdateChangePasswordView(),
          binding: UpdateChangePasswordBinding(),
        ),
        GetPage(
          name: updateAccountView,
          page: () => const UpdateAccountView(),
          binding: UpdateAccountBinding(),
        ),
        GetPage(
            name: notificationView,
            page: () => const NotificationView(),
            binding: NotificationBinding()),
      ];
}
