import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class ShortLongAnswerViewModel extends GetxController {
  String init = "";
  late List<AnswersModel> listAnswersModel;
  late QuestionsModel questionsModel;
  ManageExamViewModel manageExamViewModel = Get.find<ManageExamViewModel>();
  late TextEditingController answerTextController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    answerTextController = TextEditingController();
    questionsModel = manageExamViewModel.getCurrentQuestionModel(
        index: manageExamViewModel.currentQuetionIndex);
    listAnswersModel = questionsModel.answers!;

    print("-" * 50);
    print("intilze ShortLongAnswerViewModel");
    print("-" * 50);
  }

  @override
  void onClose() async {
    // TODO: implement onClose

    super.onClose();
  }

  void onFieldSubmitted(String value) {
    print("-" * 50);
    print(value);
    print("Question Id ${questionsModel.id}");
    print("-" * 50);
  }
}
