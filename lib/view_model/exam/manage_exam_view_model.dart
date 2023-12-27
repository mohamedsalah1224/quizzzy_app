import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/utils/routes.dart';

import 'package:quizzy_app/view/screens/exam/choose_subject.dart';
import 'package:quizzy_app/view/screens/exam/filter_questions_view.dart';
import 'package:quizzy_app/view/screens/exam/quiz_type_view.dart';

import '../../utils/constant.dart';

class ManageExamViewModel extends GetxController {
  int _currentIndex = 0;
  String? _subjectSelected;

  final List<Widget> _examViewList = const [
    ChooseSubject(),
    QuizTypeView(),
    FilterQuestionsView(),
    // ExamView(),
  ];

  List<Widget> get examViewList => _examViewList;
  int get currentIndex => _currentIndex;
  String? get subjectSelected => _subjectSelected;

  void chooseSubject({required String subjectSelected}) {
    _subjectSelected = subjectSelected;
    _currentIndex = 1;
    update();
  }

  void createYourExamByFilter() {
    _currentIndex = 2;
    update();
    // call api Repositry for filter Question
  }

  void confirmFilter() {
    // _currentIndex = 3;
    // update();
    // call api to create Exam Based on Filter information

    Get.toNamed(Routes.examView);
  }

  void createOtherExam(QuizType quizType) {
    // _currentIndex = 3;
    // update();
    // call api Service to create Exam for other Quetion (Q)
    // ( quizType== QuizType.ai ) // call Api for Ai Reposirty
    Get.toNamed(Routes.examView);
  }

  void resetController() {
    _currentIndex = 0;
    _subjectSelected = null;
  }
}
