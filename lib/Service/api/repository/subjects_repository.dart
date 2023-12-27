import 'package:quizzy_app/model/subject_model.dart';
import 'package:quizzy_app/model/subjects_model.dart';

abstract class SubjectsRepository {
  Future<SubjectsModel> getSubjects({int? skip, int? limit});

  Future<SubjectModel> getSubjectById({required int id});
}
