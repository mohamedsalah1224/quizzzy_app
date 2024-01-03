import 'package:get/get.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class TrueFalseExamViewModel extends GetxController {
  String init = "";
  late List<AnswersModel> listAnswersModel;
  late QuestionsModel questionsModel;
  ManageExamViewModel manageExamViewModel = Get.find<ManageExamViewModel>();
  int? selectedIndex;

  int? idQueion; // 4 true
  int? answerSelectedId;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    questionsModel = manageExamViewModel.getCurrentQuestionModel(
        index: manageExamViewModel.currentQuetionIndex);
    listAnswersModel = questionsModel.answers!;

    print("On Init SuCESS TrueFalseExamViewModel");
  }

  void onTap({required int idAnswerValue, required int index}) {
    if (idAnswerValue == answerSelectedId) return; // to Skip the rebuild
    answerSelectedId = idAnswerValue;
    idQueion = questionsModel.id;
    selectedIndex = index;
    update(["TrueFalseComponent"]);
    print("-" * 50);
    print("Question Id $idQueion \n answerSelectedId:$answerSelectedId");
    print("-" * 50);
    print("OK");
  }
}
