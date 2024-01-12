import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class SingleChoiceExamViewModel extends ChangeNotifier {
  bool isNotFirstTimeToLoadConstractor = false;
  late List<AnswersModel> listAnswersModel;
  late QuestionsModel questionsModel;

  late ManageExamViewModel manageExamViewModel;
  int? selectedIndex;

  int? idQueion; // 4 true
  int? answerSelectedId; // 3 , 4 , 1

  void initObject() {
    manageExamViewModel = Get.find<ManageExamViewModel>();

    questionsModel = manageExamViewModel.getCurrentQuestionModel(
        index: manageExamViewModel.currentQuetionIndex);
    listAnswersModel = questionsModel.answers!;
    selectedIndex = null;
    idQueion = null;
    answerSelectedId = null;
    print("+" * 50);
    print("Sucess Init the object SingleChoiceExamViewModel");
    print("+" * 50);
    if (isNotFirstTimeToLoadConstractor) notifyListeners();

    isNotFirstTimeToLoadConstractor = true;
  }

  SingleChoiceExamViewModel() {
    initObject();
  }

  void onTap({required int idAnswerValue, required int index}) {
    if (idAnswerValue == answerSelectedId) return; // to Skip the rebuild
    answerSelectedId = idAnswerValue;
    idQueion = questionsModel.id;
    selectedIndex = index;
    notifyListeners();
    print("-" * 50);
    print("Question Id $idQueion \n answerSelectedId:$answerSelectedId");
    print("-" * 50);
    print("OK");
  }
}
