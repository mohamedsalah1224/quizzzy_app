import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:quizzy_app/utils/validation.dart';

import '../../utils/form_validator.dart';
import '../../utils/routes.dart';

class RegisterViewModel extends GetxController {
  String initRegisterViewModel = "";

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> continueRegisterFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailOrPhoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  String? governorateValue;
  String? stateOfAreaValue;
  String? areaName;
  String? specializationValue;
  String? academicYearValue;
  bool isVisibilityErroMessage = false;
  int groupValue = 1; // 1 deafult value mean "قطاع غزة"
  List<String> governorateList = [
    "القدس",
    "بيت لحم",
    "الخليل",
    "رام الله والبيرة",
    "نابلس",
    "سلفيت",
    "قلقيلية",
    "طولكرم",
    "طوباس",
    "جنين",
    "أريحا والأغوار",
    "شمال غزة",
    "غزة",
    "الوسطى",
    "خان يونس",
    "رفح"
  ];
// (مدينة — قرية— مخيم)
  List<String> stateOfAreaList = ["مخيم", "قرية", "مدينة"];

  List<String> areaNameList = [
    "ٌيرجي اختيار اسم المحافظة أولا",
    "fsdfsdf",
    "fsdf"
  ];

  Map<String, List> getAreaName = {
    "القدس": [
      "أبو ديس",
      "أبو غوش",
      "إشوع",
      "أم طوبا",
      "بتير",
    ],
    "بيت لحم": ["الحجيلة", "الحدايدة", "الحلقوم"],
    "الخليل": [],
    "رام الله والبيرة": [],
    "نابلس": [],
    "سلفيت": [],
    "قلقيلية": [],
    "طولكرم": [],
    "طوباس": [],
    "جنين": [],
    "أريحا والأغوار": [],
    "شمال غزة": [],
    "غزة": [],
    "الوسطى": [],
    "خان يونس": [],
    "رفح": [],
  };

  List<String> academicYearList = const ["الصف الثاني عشر", "الصف الحادي عشر"];
  List<String> specializationList = const ["علمي", "ادبي", "فني"];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("On Init");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    dateController.dispose();
  }

  void updateRadioButton({required int value}) {
    groupValue = value;
    update(["regionRadioButton"]);
  }

  void updateGovernorate({required String value}) {
    governorateValue = value;
    update(['governorate']);
  }

  void updateStateOfAreaList({required String value}) {
    stateOfAreaValue = value;
    update(['stateOfArea']);
  }

  void updateAreaName({required String value}) {
    areaName = value;
    update(['areaName']);
  }

  void updateAcademicYear({required String value}) {
    academicYearValue = value; // academicYearIdValue
    update(['academicYear']);
  }

  void updateSpecialization({required String value}) {
    specializationValue = value;
    update(['specialization']);
  }

  bool validateFieldsOfDropDown() {
    if (governorateValue == null ||
        stateOfAreaValue == null ||
        areaName == null ||
        specializationValue == null ||
        academicYearValue == null) {
      isVisibilityErroMessage = true;
      update(['visibility']);
      return true;
    } else {
      isVisibilityErroMessage = false;
      return false;
    }
  }

  Future<void> showDate(BuildContext context) async {
    await showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(1900),
            lastDate: DateTime(2023))
        .then((value) {
      if (value != null) {
        String date = DateFormat('yyy:MM:dd').format(value);
        dateController.text = date;
      }
    });
  }

  String? validatePhoneOrEmail({String? value}) {
    return FormValidator.instance
        .validatePhoneOrEmail(value, startPlusCode: true);
  }

  String? validateName({String? value}) {
    return FormValidator.instance.anyTextFormValidator(value, "Name");
  }

  String? validateUserName({String? value}) {
    return FormValidator.instance.anyTextFormValidator(value, "User Name");
  }

  String? validateBirthDate({String? value}) {
    return FormValidator.instance.anyTextFormValidator(value, "Birth Data");
  }

  String? validatePaswword({String? value}) {
    return FormValidator.instance.passwordValidator(value);
  }
  // confirmPasswordValidator

  String? confirmPasswordValidator({String? value}) {
    return FormValidator.instance.confirmPasswordValidator(
        passwordConfirmController.text, passwordController.text);
  }

  void continueregisterView() {
    if (registerFormKey.currentState!.validate()) {
      if (validateFieldsOfDropDown())
        return; // to show the Message erro if any Fields equal null
      if (Validation.instance.isEmail(email: emailOrPhoneController.text)) {
        Get.toNamed(Routes.verifyEmailView);
      } else {
        Get.toNamed(Routes.verifyPhoneView);
      }
    }
  }

  void logIn() {
    if (continueRegisterFormKey.currentState!.validate()) {
      Get.offAllNamed(Routes.loginView);
    }
  }
}
