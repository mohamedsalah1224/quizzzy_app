import 'package:get/get.dart';
import 'package:quizzy_app/view_model/exam/exam_type/compare_choice_exam_view_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/multiple_choice_exam_view_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/short_long_answer_choice_exam_view_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/single_choice_exam_view_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/true_false_exam_view_model.dart';

class QuestionsTypeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompareChoiceExamViewModel(), fenix: true);
    Get.lazyPut(() => MultipleChoiceExamViewModel(), fenix: true);
    Get.lazyPut(() => ShortLongAnswerViewModel(), fenix: true);
    Get.lazyPut(() => SingleChoiceExamViewModel(), fenix: true);
    Get.lazyPut(() => TrueFalseExamViewModel(), fenix: true);
  }
}
