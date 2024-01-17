import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/attempt_answers_repository_service.dart';
import 'package:quizzy_app/model/exam_statistics_model.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class ExamStatisticsViewModel extends GetxController {
  bool _isLoadExamStatisticsViewPage = false;
  late ExamStatisticsModel examStatisticsModel;
  late ExamAttempt examAttemptStatisticsInofrmation;
  bool get isLoadExamStatisticsViewPage => _isLoadExamStatisticsViewPage;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _attemptAnswersService(
        examAttemptId:
            Get.find<ManageExamViewModel>().startQuizModel.data!.id!);
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

      examStatisticsModel = value;
      examAttemptStatisticsInofrmation = value.data!.examAttempt!;
      _isLoadExamStatisticsViewPage = true;
      update(["updateExamStatisticsView"]);
    }).catchError((e) => SnackBarHelper.instance.showMessage(
            message: e.toString(), milliseconds: 2000, erro: true));
  }
}
