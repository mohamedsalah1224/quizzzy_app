import 'package:quizzy_app/utils/constant.dart';

class GeneralUtils {
  static GeneralUtils? _instance;
  static GeneralUtils get instance => _instance ??= GeneralUtils._();

  GeneralUtils._();

  String convertLoginEnumTypeToString(SourceLoginType sourceLoginType) {
    if (SourceLoginType.email == sourceLoginType) {
      return "email";
    } else {
      return "phone";
    }
  }
}
