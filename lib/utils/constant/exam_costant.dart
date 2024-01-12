import 'package:flutter/material.dart';

class ExamConstatnt {
  const ExamConstatnt._();
  static const String singleChoice = "single_choice";
  static const String multipleChoice = "multiple_choice";
  static const String trueFalse = "true_false";
  static const String shortAnswer = "short_answer";
  static const String longAnswer = "long_answer";
  static const String compare = "compare";
  static const String typeAssessmentAfterFinish = "after_finish";
  static const String typeAssessmenDirect = "direct";
  static const String choiceExam = "choice";
  static const String randomlyExam = "randomly";
  static const String aiExam = "ai";

  static const String answerViewFormatIamge = "image";
  static const String answerViewFormatText = "text"; // text_image
  static const String answerViewFormatTextImage = "text_image";
  // choice_specialist

  static const String specialistExam = "choice_specialist";

  static const String video = "video";

  static BuildContext? _currentContextQuestion;

  static void setNewQuestionContext(BuildContext context) {
    _currentContextQuestion = context;
  }

  static BuildContext get currentContextQuestion => _currentContextQuestion!;
}
