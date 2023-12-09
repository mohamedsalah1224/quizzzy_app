import 'package:quizzy_app/model/academic_year_model.dart';
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

  String getGroupValueName({required int groupValue}) {
    return groupValue == 1 ? "قطاع غزة" : "الضفة الغربية";
  }

  int? getAcademicYearById(
      {required List<AcademicYearModel> academicYearList,
      required String value}) {
    for (int i = 0; i < academicYearList.length; i++) {
      if (academicYearList[i].name == value) {
        return academicYearList[i].id!;
      }
    }

    return null;
  }

  List<String> convertAcdemicYearToListOfString(
      {required List<AcademicYearModel> academicYearList}) {
    return academicYearList.map((e) => e.name!).toList();
  }
}
