import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/units_repository_service.dart';
import 'package:quizzy_app/model/leasons_model.dart';
import 'package:quizzy_app/model/unit_data_model.dart';
import 'package:quizzy_app/utils/constant/exam_costant.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';
import 'package:quizzy_app/view_model/exam/exam_type/multiple_choice_exam_view_model.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';
import 'package:quizzy_app/view_model/utils/multiselectDropdown/multiselect_dropdown_view_model.dart';

class FilterQuestionsViewModel extends GetxController {
  bool _isLoadFilterPage = false;
  List<String> semester = ["الكل", "الأول", "الثاني", "الثالث", "الرابع"];
  List<String> levelOfExam = ["سهل", "متوسط", "صعب"];
  List<String> time = ['10', '15', '20', '30', '60'];
  List<String> typeOfQuestion = [
    "Single Choice",
    "Multiple Choice",
    "Compare",
    "True_False",
    "ShortAnswer",
    "LongAnswer"
  ];

  String? semesterValue;
  String? levelofExamValue;
  String? timeValue;
  int evaluationGroupValue = 1;
  //  التقييم عند الانتهاء

  String? unitValue;
  String? leasonValue;
  List<LessonsModel> listLeaseon = [];
  late List<UnitDataModel> unitsModel;
  List<UnitDataModel> unitValueList = [];

  bool get isLoadFilterPage => _isLoadFilterPage;

  @override
  void onInit() {
    // TODO: implement onInit
    _getUnits();
    super.onInit();
  }

  //////////////////////// Update Section /////////////////////////

  void updateSemester(String? value) {
    semesterValue = value;
    String? idSemester = getIdOfSemester(value!);
    unitValue = null;
    leasonValue = null;

    unitValueList = idSemester != null
        ? unitsModel
            .where(((element) => element.semester == idSemester))
            .toList()
        : unitsModel;

    print("-" * 50);

    print("List of Unit : $unitValueList");
    print("-" * 50);
    // listLeaseon =
    //     listUnits.firstWhere((element) => (element.name == value)).lessons ??
    //         [];
    update(["updateSemester", "updateUnits", "updateLeasons"]);
  }

  void updateTime(String? value) {
    timeValue = value;

    update(["updateTime"]);
  }

  void updateLevelOfExam(String? value) {
    levelofExamValue = value;
    update(["updateLevelOfExam"]);
  }

  void updateEvaluation(int value) {
    evaluationGroupValue = value;
    update(["updateEvaluation"]);
  }

  void updateUnits(String value) {
    unitValue = value;
    leasonValue = null;
    listLeaseon = unitValueList
            .firstWhere((element) => (element.name == value))
            .lessons ??
        [];

    update(["updateUnits"]);
    update(["updateLeasons"]);
  }

  void updateLeasons(String value) {
    leasonValue = value;

    update(["updateLeasons"]);
  }

  ////////////////////////////////// Service /////////////////////////////

  void _getUnits() {
    _isLoadFilterPage = false;
    ManageExamViewModel manageExamViewModel = Get.find<ManageExamViewModel>();
    UnitsRepositoryService()
        .getUnits(
      subjectId: manageExamViewModel.getSubjectSelectedInformation.id!,
      bookId: manageExamViewModel.getBookSelected.id!,
      // semester:semesterId, // to Load All Unit
    )
        .then((value) {
      if (value.success!) {
        unitsModel = value.data!;
        semesterValue = null;
        _isLoadFilterPage = true;

        update(['updateLoadFilterPage']);
      }
    }).catchError((e) => SnackBarHelper.instance
            .showMessage(message: e.toString(), erro: true));
  }

  List<String> get unitsValueList => unitValueList.map((e) => e.name!).toList();
  List<String> get leasonsValueList => listLeaseon.map((e) => e.name!).toList();

  int? get unitId => unitValue != null
      ? unitValueList.firstWhere((element) => (element.name == unitValue)).id
      : null;

  int? get leasonId => leasonValue != null
      ? listLeaseon.firstWhere((element) => (element.name == leasonValue)).id
      : null;

  String get semesterOfUnit => unitValueList
      .firstWhere((element) => (element.name == unitValue))
      .semester!;

  int? get getTimeSecounds =>
      timeValue != null ? int.parse(timeValue!) * 60 : null;

  String? get getlevelofExam => levelofExamValue ?? levelofExamValue;
  String get getEvaluation => evaluationGroupValue == 1
      ? ExamConstatnt.typeAssessmentAfterFinish
      : ExamConstatnt.typeAssessmenDirect;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    print("-" * 50);
    print("semester $semesterOfUnit");
    print("unit $unitId");
    print("leason $leasonId");
    print("time $getTimeSecounds");
    print("levelOfExam $getlevelofExam");
    print("Evaluation $getEvaluation");
    print("-" * 50);
  }

  void confirmFilter(BuildContext context) {
    if (semesterValue == null) {
      SnackBarHelper.instance.showMessage(
          erro: true,
          isEnglish: false,
          message: 'يجب عليك اختيار الصف الدراسي');

      return;
    }
    Get.find<ManageExamViewModel>().confirmFilter(
      leasonId: leasonId,
      level: getlevelofExam,
      semesterId: getIdOfSemester(semesterValue!),
      time: getTimeSecounds,
      typeAssessment: getEvaluation,
      unitId: unitId,
      questionTypes:
          Get.find<MultiSelectDropDownViewModel>().getEnglishSelectedQuestion(),
    );
  }

  String? getIdOfSemester(String value) {
    // ["الكل", "الأول", "الثاني", "الثالث", "الرابع"];
    if (value == "الأول") {
      return "1";
    } else if (value == "الثاني") {
      return "2";
    } else if (value == "الثالث") {
      return "3";
    } else if (value == "الرابع") {
      return "4";
    } else {
      return null; // null mean it Selecte All
    }
  }

  void backFromFilter() {
    Get.find<ManageExamViewModel>().backFromFilter();
  }
}
