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
  TextEditingController answerTextController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    questionsModel = manageExamViewModel.getCurrentQuestionModel(
        index: manageExamViewModel.currentQuetionIndex);
    listAnswersModel = questionsModel.answers!;

    print("On Init SuCESS ShortLongAnswerViewModel");
  }
}
