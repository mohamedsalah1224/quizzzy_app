import 'package:flutter/material.dart';
import 'package:quizzy_app/model/academic_year_model.dart';
import 'package:quizzy_app/utils/constant.dart';
import 'dart:math' as math;

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

  Color generateColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
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

  String convertSocialMediaEnumToString(SocialMediaType socialMediaType) {
    if (SocialMediaType.apple == socialMediaType) {
      return "apple";
    } else if (SocialMediaType.apple == socialMediaType) {
      return "google";
    } else {
      return "facebook";
    }
  }
}
