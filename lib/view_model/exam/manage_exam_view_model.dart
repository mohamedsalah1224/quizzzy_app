import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/subjects_repository_service.dart';
import 'package:quizzy_app/model/data_subject_model.dart';
import 'package:quizzy_app/utils/routes.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';

import 'package:quizzy_app/view/screens/exam/choose_subject.dart';
import 'package:quizzy_app/view/screens/exam/filter_questions_view.dart';
import 'package:quizzy_app/view/screens/exam/quiz_type_view.dart';

import '../../utils/constant.dart';

class ManageExamViewModel extends GetxController {
  bool _isLoadChoicePage = false;
  int _currentIndex = 0;
  int? _subjectSelectedId;
  late List<DataSubjectModel> _subjectList;

  final List<Widget> _examViewList = const [
    ChooseSubject(),
    QuizTypeView(),
    FilterQuestionsView(),
    // ExamView(),
  ];

  List<Widget> get examViewList => _examViewList;
  int get currentIndex => _currentIndex;
  bool get isLoadChoicePage => _isLoadChoicePage;
  List<DataSubjectModel> get subjectList => _subjectList;
  int? get subjectSelected => _subjectSelectedId;

  void chooseSubject({required int subjectSelectedId}) {
    _subjectSelectedId = subjectSelectedId;
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
    _subjectSelectedId = null;
  }

  ///////////////////////////////Life cylce/////////////////////////////////////

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getSubjects();
  }

  //////////////////////////////////// Service ///////////////////////////////////

  void _getSubjects({int? limit, int? skip}) {
    try {
      SubjectsRepositoryService()
          .getSubjects(limit: limit, skip: skip)
          .then((value) {
        print(value.data);
        _subjectList = value.data!;
        _isLoadChoicePage = true;
        update(['loadingChoicePage']);
      });
    } catch (e) {
      SnackBarHelper.instance.showMessage(message: e.toString(), erro: true);
    }
  }
}
