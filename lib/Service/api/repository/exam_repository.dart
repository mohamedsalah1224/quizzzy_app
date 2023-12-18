import 'package:quizzy_app/model/exams_model.dart';
import 'package:quizzy_app/model/store_exam_model.dart';

abstract class ExamRepository {
  Future<ExamsModel> getExams({int? skip, int? limit});
  Future<ExamsModel> showExam({required int id}); // path the id
  Future<ExamsModel> storeExam({required StoreExamModel storeExamModel});
}
