import 'package:get/get.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class CompareChoiceExamViewModel extends GetxController {
  String init = "";
  late QuestionsModel questionsModel;
  ManageExamViewModel manageExamViewModel = Get.find<ManageExamViewModel>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    questionsModel = manageExamViewModel.getCurrentQuestionModel(
        index: manageExamViewModel.currentQuetionIndex);

    print("On Init SuCESS CompareChoiceExamViewModel");
  }
}
