import 'package:get/get.dart';

class FilterQuestionsViewModel extends GetxController {
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

  @override
  void onInit() {
    // TODO: implement onInit
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
}
