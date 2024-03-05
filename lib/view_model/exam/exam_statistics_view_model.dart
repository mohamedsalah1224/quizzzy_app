import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/attempt_answers_repository_service.dart';
import 'package:quizzy_app/model/exam_attempt_model.dart';
import 'package:quizzy_app/model/exam_statistics_model.dart';
import 'package:quizzy_app/utils/dialog_helper.dart';
import 'package:quizzy_app/utils/pdf_helper/pdf_converter_to_image.dart';
import 'package:quizzy_app/utils/pdf_helper/pdf_generator.dart';
import 'package:quizzy_app/utils/routes.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';
import 'package:quizzy_app/view/screens/bottomNavigation/mange_bottom_sheet_view.dart';
import 'package:quizzy_app/view_model/bottomNavigation/home_view_model.dart';
import 'package:quizzy_app/view_model/bottomNavigation/mange_bottom_navigation_view_model.dart';
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
    PdfGenerator.init();
    int examAttemptId = controllerOfMangeExamViewModel.startQuizModel.data!.id!;

    _removeExamAttempt(
        examAttemptId:
            examAttemptId); // to remove the ExamAttempt From the List in the HomeviewModel

    _attemptAnswersService(examAttemptId: examAttemptId!);
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
    controllerOfMangeExamViewModel.resetAllController();
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
        controllerOfMangeExamViewModel.isExamAttempt
            ? const Duration(seconds: 3)
            : const Duration(seconds: 3),
        () {
          // Navigate to your favorite place
          DialogHelper.hideLoading();
          update(['updateAboveSection', 'updateBlewSection']);
          // to update when The Dialog Disposed

          Get.until((route) => Get.currentRoute == Routes.examView);
          controllerOfMangeExamViewModel.resetDurationTimer();
        },
      );
    }); // to call the StartQuiz Again
  }

  void _removeExamAttempt({required int examAttemptId}) {
    // use in go to Home , ReptionExam
    if (controllerOfMangeExamViewModel.isExamAttempt) {
      // Remove this Exam from the HomView
      print("*" * 50);
      print(examAttemptId);
      print("*" * 50);
      Get.find<HomeViewModel>()
          .removeAnExamAttemptById(examAttemptId: examAttemptId);
    }
  }

  void goToHomePage() {
    controllerOfMangeExamViewModel.resetAllController();
    controllerOfMangeExamViewModel.resetController();
    ManageBottomNavigationViewModel manageBottomNavigationViewModel =
        Get.find<ManageBottomNavigationViewModel>();

    HomeViewModel homeViewModel = Get.find<HomeViewModel>();
    if (controllerOfMangeExamViewModel.isExamAttempt) {
      // Get.offAllNamed(Routes.bottomNavgation);
      // manageBottomNavigationViewModel.gotToHomePageManuallyWithoutClickOnIt();

      homeViewModel.setIsLoadHomeViewPage(show: false); // to diable homeView

      Timer(const Duration(seconds: 2), () {
        Get.until((route) => Get.currentRoute == Routes.bottomNavgation);
        homeViewModel.setIsLoadHomeViewPage(
            show: true); // to update the HomeView

        // manageBottomNavigationViewModel.gotToHomePageManuallyWithoutClickOnIt();
      });
    } else {
      manageBottomNavigationViewModel.gotToHomePageManuallyWithoutClickOnIt();
      Get.until((route) => Get.currentRoute == Routes.bottomNavgation);
    }
  }

  void convertToPdf() async {
    // var permissionStatus = await Permission.storage.status;

    // switch (permissionStatus) {
    //   case PermissionStatus.denied:
    //   case PermissionStatus.permanentlyDenied:
    //     //    await Permission.manageExternalStorage.request();
    //     break;
    //   default:
    // }
    // // PdfGenerator.createPdf();

    PdfGenerator.createPdf();
    print("Create to Pdf");
  }

  void shareFile() {
    print("Shar the File");
  }
}
