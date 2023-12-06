import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoint {
  EndPoint._();

  static final String baseUrl = dotenv.get("BASE_URL");
  static final String login = dotenv.get("LOGIN");
  static final String logout = dotenv.get("LOGOUT");
  static final String register = dotenv.get("REGISTER");
  static final String checkUser = dotenv.get("CHECK_USER");
  static final String socialLogin = dotenv.get("SOCIAL_LOGIN");

  static final String messgeApiResponse =
      dotenv.get("MESSAGE_API"); // to get Message Erro when occur Execption
}
