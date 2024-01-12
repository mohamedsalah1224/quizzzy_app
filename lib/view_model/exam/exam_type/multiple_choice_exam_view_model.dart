import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class MultipleChoiceExamViewModel extends ChangeNotifier {
  late List<AnswersModel> listAnswersModel;
  late QuestionsModel questionsModel;
  late ManageExamViewModel manageExamViewModel;
  List<int> listAnswerIdSelected = [];

  void initObject() {
    manageExamViewModel = Get.find<ManageExamViewModel>();

    questionsModel = manageExamViewModel.getCurrentQuestionModel(
        index: manageExamViewModel.currentQuetionIndex);
    listAnswersModel = questionsModel.answers!;
    listAnswerIdSelected = [];
    print("+" * 50);
    print("Sucess Init the object MultipleChoiceExamViewModel");
    print("+" * 50);
  }

  MultipleChoiceExamViewModel() {
    initObject();
  }

  void onTap({required int idAnswer, required bool value}) {
    //  update(["MultipleChoice $idAnswer"]); // to rebuild only that have this id
    notifyListeners();
    if (value) {
      listAnswerIdSelected.add(idAnswer); // to add the id from the List
    } else {
      listAnswerIdSelected.remove(idAnswer); // to remove the id from the List
    }

    print("-" * 50);
    print(listAnswerIdSelected);
    print("-" * 50);
  }

  int? isIdExist(int index) {
    return listAnswerIdSelected.contains(listAnswersModel[index].id!)
        ? listAnswersModel[index].id!
        : null;
  }
}
