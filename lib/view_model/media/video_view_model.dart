import 'package:get/get.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';
import 'package:video_player/video_player.dart';

class VideoViewModel extends GetxController {
  late QuestionsModel questionsModel;
  ManageExamViewModel manageExamViewModel = Get.find<ManageExamViewModel>();
  late VideoPlayerController _controller;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    questionsModel = manageExamViewModel.getCurrentQuestionModel(
        index: manageExamViewModel.currentQuetionIndex);

    _controller =
        VideoPlayerController.networkUrl(Uri.parse(questionsModel.file!))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            // setState(() {});
            _controller.play();
            update(["updateVideo"]);
          });
  }
}
