import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/units_repository_service.dart';
import 'package:quizzy_app/model/leasons_model.dart';
import 'package:quizzy_app/model/unit_data_model.dart';
import 'package:quizzy_app/utils/constant/exam_costant.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class FilterQuestionsViewModel extends GetxController {
  bool _isLoadFilterPage = false;
  List<String> semester = ["الأول", "الثاني"];
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
  late List<UnitDataModel> listUnits;

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
    update(["updateSemester"]);
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
    listLeaseon =
        listUnits.firstWhere((element) => (element.name == value)).lessons ??
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
    UnitsRepositoryService()
        .getUnits(
            subjectId: Get.find<ManageExamViewModel>()
                .getSubjectSelectedInformation
                .id!)
        .then((value) {
      if (value.success!) {
        listUnits = value.data!;

        _isLoadFilterPage = true;
        update(['updateLoadFilterPage']);
      }
    }).catchError((e) => SnackBarHelper.instance
            .showMessage(message: e.toString(), erro: true));
  }

  List<String> get unitsValueList => listUnits.map((e) => e.name!).toList();
  List<String> get leasonsValueList => listLeaseon.map((e) => e.name!).toList();

  int? get unitId => unitValue != null
      ? listUnits.firstWhere((element) => (element.name == unitValue)).id
      : null;

  int? get leasonId => leasonValue != null
      ? listLeaseon.firstWhere((element) => (element.name == leasonValue)).id
      : null;

  String? get semesterId => semesterValue != null
      ? semesterValue == "الأول"
          ? "1"
          : "2"
      : null;

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
    print("semester $semesterId");
    print("unit $unitId");
    print("leason $leasonId");
    print("time $getTimeSecounds");
    print("levelOfExam $getlevelofExam");
    print("Evaluation $getEvaluation");
    print("-" * 50);
  }

  void confirmFilter() {
    Get.find<ManageExamViewModel>().confirmFilter(
      leasonId: leasonId,
      level: getlevelofExam,
      semesterId: semesterId,
      time: getTimeSecounds,
      typeAssessment: getEvaluation,
      unitId: unitId,
    );
  }
}
