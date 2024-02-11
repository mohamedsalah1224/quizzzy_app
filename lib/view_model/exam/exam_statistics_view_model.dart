import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/attempt_answers_repository_service.dart';
import 'package:quizzy_app/model/exam_attempt_model.dart';
import 'package:quizzy_app/model/exam_statistics_model.dart';
import 'package:quizzy_app/utils/dialog_helper.dart';
import 'package:quizzy_app/utils/routes.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class ExamStatisticsViewModel extends GetxController {
  bool _isLoadExamStatisticsViewPage = false;
  late ExamStatisticsModel _examStatisticsModel;
  late ExamAttemptModel _examAttemptStatisticsInofrmation;
  bool get isLoadExamStatisticsViewPage => _isLoadExamStatisticsViewPage;
  ExamStatisticsModel get examStatisticsModel => _examStatisticsModel;
  ExamAttemptModel get examAttemptStatisticsInofrmation =>
      _examAttemptStatisticsInofrmation;

  ManageExamViewModel controllerOfMangeExamViewModel =
      Get.find<ManageExamViewModel>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    int examattemptId = controllerOfMangeExamViewModel.startQuizModel.data!.id!;
    print("*" * 50);
    print(examattemptId);
    print("*" * 50);
    _attemptAnswersService(examAttemptId: examattemptId);
  }

////////////////////////////////// Service ////////////////////////////////////
  ///
  void _attemptAnswersService({required int examAttemptId}) {
    _isLoadExamStatisticsViewPage = false;
    AttemptAnsweRepositoryService()
        .getAttemptAnswersById(examEttemptId: examAttemptId)
        .then((value) {
      print("-" * 50);
      print(value);

      print("-" * 50);

      _examStatisticsModel = value;
      _examAttemptStatisticsInofrmation = value.data!.examAttempt!;
      _isLoadExamStatisticsViewPage = true;
      update(["updateExamStatisticsView"]);
    }).catchError((e, s) {
      print('-' * 50);
      print(e.toString());
      print('-' * 50);

      print(s.toString());
      SnackBarHelper.instance
          .showMessage(message: e.toString(), milliseconds: 2000, erro: true);
    });
  }

  void repetitionExam() {
    DialogHelper.showLoading(
        message: 'يتم الان إعادة الاختبار ....',
        textDirection: TextDirection.rtl);
    controllerOfMangeExamViewModel
        .resetValueOfRepitionExam(); // to _isLoafExamViewPage False , Map of Answers
    update(['updateAboveSection', 'updateBlewSection']);
    controllerOfMangeExamViewModel
        .startQuizService(
            examId: controllerOfMangeExamViewModel.examData.data!.id!)
        .then((value) {
      Timer(
        const Duration(seconds: 3),
        () {
          // Navigate to your favorite place
          DialogHelper.hideLoading();
          Get.until((route) => Get.currentRoute == Routes.examView);
        },
      );
    }); // to call the StartQuiz Again
  }

  void goToHomePage() {
    controllerOfMangeExamViewModel.resetAllController();
    Get.until((route) => Get.currentRoute == Routes.bottomNavgation);
  }
}
