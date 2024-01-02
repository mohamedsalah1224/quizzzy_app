import 'package:get/get.dart';
import 'package:quizzy_app/view_model/exam/exam_type/compare_choice_exam_view_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/multiple_choice_exam_view_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/short_long_answer_choice_exam_view_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/single_choice_exam_view_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/true_false_exam_view_model.dart';

class QuestionsTypeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompareChoiceExamViewModel());
    Get.lazyPut(() => MultipleChoiceExamViewModel());
    Get.lazyPut(() => ShortLongAnswerViewModel());
    Get.lazyPut(() => SingleChoiceExamViewModel());
    Get.lazyPut(() => TrueFalseExamViewModel());
  }
}
