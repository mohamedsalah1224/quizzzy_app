import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoint {
  EndPoint._();

  static final String baseUrl = dotenv.get("BASE_URL");
  static final String login = dotenv.get("LOGIN");
  static final String logout = dotenv.get("LOGOUT");
  static final String register = dotenv.get("REGISTER");
  static final String checkUser = dotenv.get("CHECK_USER");
  static final String socialLogin = dotenv.get("SOCIAL_LOGIN");
  // /api/academic-years
  static final String academiYears = dotenv.get("ACADEMIC_YEARS");
  static final String _academiYear = dotenv.get("ACADEMIC_YEAR");
  static final String messgeApiResponse =
      dotenv.get("MESSAGE_API"); // to get Message Erro when occur Execption

  static final String verifyCode = dotenv.get("VERIFY_CODE");
  static final String forgetPassword = dotenv.get("FORGET_PASSWORD");
  static final String resetPassword = dotenv.get("RESET_PASSWORD");
  static final String veifyEmailCode = dotenv.get("VERIFY_EMAIL_CODE");
  static final String reSendVeifyEmail = dotenv.get("RESEND_VERIFY_EMAIL");

  static String getFullAcademiYear({required int id}) => "$_academiYear$id";
}
