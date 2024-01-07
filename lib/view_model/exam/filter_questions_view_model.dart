import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/units_repository_service.dart';
import 'package:quizzy_app/model/leasons_model.dart';
import 'package:quizzy_app/model/unit_data_model.dart';
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
  int evaluationGroupValue = 1; //  التقييم عند الانتهاء
  List<LessonsModel> listLeaseon = [];
  late List<UnitDataModel> listUnitModel;

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
        listUnitModel = value.data!;
        _isLoadFilterPage = true;
        update(['updateLoadFilterPage']);
      }
    }).catchError((e) => SnackBarHelper.instance
            .showMessage(message: e.toString(), erro: true));
  }
}
