import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class TrueFalseExamViewModel extends ChangeNotifier {
  bool isNotFirstTimeToLoadConstractor = false;
  late List<AnswersModel> listAnswersModel;
  late QuestionsModel questionsModel;
  late ManageExamViewModel manageExamViewModel;
  int? selectedIndex;

  // int? idQueion; // 4 true
  int? answerSelectedId;

  void initObject() {
    manageExamViewModel = Get.find<ManageExamViewModel>();

    questionsModel = manageExamViewModel.getCurrentQuestionModel(
        index: manageExamViewModel.currentQuetionIndex);
    listAnswersModel = questionsModel.answers!;
    selectedIndex = null;
    // idQueion = null;
    answerSelectedId = null;
    print("+" * 50);
    print("Sucess Init the object TrueFalseExamViewModel");
    print("+" * 50);
    if (isNotFirstTimeToLoadConstractor) notifyListeners();

    isNotFirstTimeToLoadConstractor = true;
  }

  TrueFalseExamViewModel() {
    initObject();
  }

  void onTap({required int idAnswerValue, required int index}) {
    if (idAnswerValue == answerSelectedId) return; // to Skip the rebuild
    answerSelectedId = idAnswerValue;

    selectedIndex = index;

    notifyListeners();
    print("-" * 50);
    print(
        "Question Id ${questionsModel.id} \n answerSelectedId:$answerSelectedId");
    addAnswer(answerValue: answerSelectedId!);
    print("-" * 50);
    print("OK");
  }

  void addAnswer({required int answerValue}) {
    manageExamViewModel.addAnswerQuestion(
        mapEntry: MapEntry(questionsModel.id.toString(), answerValue));
    manageExamViewModel.printMapOfAnswerQuestion();
  }
}
