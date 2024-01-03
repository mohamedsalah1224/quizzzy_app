import 'package:dio/dio.dart';
import 'package:quizzy_app/Service/Networking/dio_helper.dart';
import 'package:quizzy_app/Service/api/repository/exam_repository.dart';
import 'package:quizzy_app/model/exams_model.dart';
import 'package:quizzy_app/model/store_exam_model.dart';
import 'package:quizzy_app/model/validation_erro_model.dart';
import 'package:quizzy_app/utils/end_point.dart';

class ExamRepositoryService implements ExamRepository {
  @override
  void answerQuestion(
      {required int questionId,
      required int examAttemptId,
      required List<int> givenAnswer}) {
    // TODO: implement answerQuestion
  }

  @override
  Future<ExamsModel> getExams(
      {int? skip,
      int? limit,
      required String type,
      required int subjectId,
      String? typeAssessment}) {
    // TODO: implement getExams
    throw UnimplementedError();
  }

  @override
  Future<ExamsModel> showExam({required int id}) {
    // TODO: implement showExam
    throw UnimplementedError();
  }

  @override
  void startQuiz({required int examId}) async {}

  @override
  Future<ExamsModel> storeExam({required StoreExamModel storeExamModel}) async {
    try {
      var reponse = await DioHelper().post(EndPoint.storeExams, data: {
        'name': storeExamModel.name,
        'type': storeExamModel.type,
        'question_types': storeExamModel.questionTypes,
        'level': storeExamModel.level,
        'type_assessment': storeExamModel.typeAssessment,
        'description': storeExamModel.description,
        'photo': storeExamModel.photo,
        'semester': storeExamModel.semester,
        'is_active': storeExamModel.isActive,
        'unit_id': storeExamModel.unitId,
        'lesson_id': storeExamModel.lessonId,
        'subject_id': storeExamModel.subjectId
      });

      return ExamsModel.fromJson(reponse);
    } on DioException catch (e) {
      throw ValidationErroModel.fromJson(e.response!.data).message.toString();
    } catch (e) {
      rethrow;
    }
  }
}
