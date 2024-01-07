import 'package:quizzy_app/model/unit_model.dart';
import 'package:quizzy_app/model/units_model.dart';

abstract class UnitsRepository {
  Future<UnitsModel> getUnits({int? skip, int? limit, required int subjectId});
  Future<UnitModel> getUnitById({required int id});
}
