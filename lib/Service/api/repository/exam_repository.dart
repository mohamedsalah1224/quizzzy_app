import 'package:quizzy_app/model/achievement_model.dart';
import 'package:quizzy_app/model/answer_question_model.dart';
import 'package:quizzy_app/model/exams_model.dart';
import 'package:quizzy_app/model/start_quiz_model.dart';
import 'package:quizzy_app/model/store_exam_model.dart';

abstract class ExamRepository {
  Future<ExamsModel> getExams(
      {int? skip,
      int? limit,
      required String type,
      required int subjectId,
      String? typeAssessment});
  Future<ExamsModel> showExam({required int id}); // path the id
  Future<ExamsModel> storeExam({required StoreExamModel storeExamModel});

  Future<StartQuizModel> startQuiz({required int examId});
  Future<AnswerQuestionModel> answerQuestion(
      {required int questionId,
      required int examAttemptId,
      required var givenAnswer});

  Future<AchievementModel> getAchievement({required int subjectId});

  // getAchievementsBySubjectId
}
