import 'package:get/get.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/model/start_quiz_model.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class SingleChoiceExamViewModel extends GetxController {
  String initSingleChoice = "";
  late List<AnswersModel> listAnswersModel;
  late QuestionsModel questionsModel;

  ManageExamViewModel manageExamViewModel = Get.find<ManageExamViewModel>();
  int? selectedIndex;

  int? idQueion; // 4 true
  int? answerSelectedId; // 3 , 4 , 1
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    questionsModel = manageExamViewModel.getCurrentQuestionModel(
        index: manageExamViewModel.currentQuetionIndex);

    listAnswersModel = questionsModel.answers!;

    print("On Init SuCESS sINGLE Choice");
  }

  void onTap({required int idAnswerValue, required int index}) {
    if (idAnswerValue == answerSelectedId) return; // to Skip the rebuild
    answerSelectedId = idAnswerValue;
    idQueion = questionsModel.id;
    selectedIndex = index;
    update(["SingleChoiceComponent"]);
    print("-" * 50);
    print("Question Id $idQueion \n answerSelectedId:$answerSelectedId");
    print("-" * 50);
    print("OK");
  }
}
