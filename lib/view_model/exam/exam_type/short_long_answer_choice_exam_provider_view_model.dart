import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/utils/constant/exam_costant.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class ShortLongAnswerViewModel extends ChangeNotifier {
  bool isNotFirstTimeToLoadConstractor = false;
  late List<AnswersModel> listAnswersModel;
  late QuestionsModel questionsModel;
  late ManageExamViewModel manageExamViewModel;
  late TextEditingController answerTextController;

  ShortLongAnswerViewModel() {
    initObject();
  }

  void initObject() {
    manageExamViewModel = Get.find<ManageExamViewModel>();
    questionsModel = manageExamViewModel.getCurrentQuestionModel(
        index: manageExamViewModel.currentQuetionIndex);
    listAnswersModel = questionsModel.answers!;

    print("Question Id ${questionsModel.id}");
    print(manageExamViewModel.answerSelectedByUser['${questionsModel.id}']);
    if (manageExamViewModel.isAfterFinish &&
        manageExamViewModel.answerSelectedByUser['${questionsModel.id}'] !=
            null) {
      print("TRUE SUCESS");

      answerTextController = TextEditingController(
          text: manageExamViewModel.answerSelectedByUser['${questionsModel.id}']
              .toString());
    } else {
      answerTextController = TextEditingController();
    }
    print("+" * 50);
    print("Sucess Init the ShortLongAnswerViewModel");
    print("+" * 50);
    if (isNotFirstTimeToLoadConstractor) notifyListeners();

    isNotFirstTimeToLoadConstractor = true;
  }

  void onFieldSubmitted(String value) {
    print("-" * 50);
    print(value);
    print("Question Id ${questionsModel.id}");
    print("-" * 50);

    addAnswer(value); //  Add Answer to the MapOfAnswerQuestions
  }

  void addAnswer(String value) {
    manageExamViewModel.addAnswerQuestion(
        mapEntry: MapEntry(questionsModel.id.toString(), value));
    manageExamViewModel.printMapOfAnswerQuestion();
  }

  void setNewContext(BuildContext context) {
    ExamConstatnt.setNewQuestionContext(context);
  }
}
