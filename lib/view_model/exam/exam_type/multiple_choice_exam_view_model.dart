import 'package:get/get.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class MultipleChoiceExamViewModel extends GetxController {
  String init = "";
  late List<AnswersModel> listAnswersModel;
  late QuestionsModel questionsModel;
  ManageExamViewModel manageExamViewModel = Get.find<ManageExamViewModel>();
  List<int> listAnswerIdSelected = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    questionsModel = manageExamViewModel.getCurrentQuestionModel(
        index: manageExamViewModel.currentQuetionIndex);
    listAnswersModel = questionsModel.answers!;
    print("On Init SuCESS MultipleChoiceExamViewModel");
  }

  void onTap({required int idAnswer, required bool value}) {
    update(["MultipleChoice $idAnswer"]); // to rebuild only that have this id
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
