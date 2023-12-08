import 'package:dio/dio.dart';
import 'package:quizzy_app/Service/Networking/dio_helper.dart';
import 'package:quizzy_app/Service/api/repository/academic_years_repository.dart';
import 'package:quizzy_app/model/academic_year_response_model.dart';
import 'package:quizzy_app/model/acdemic_years_model.dart';
import 'package:quizzy_app/utils/end_point.dart';

class AcademicYearsRepositoryService implements AcademicYearsRepository {
  @override
  Future<AcdemicYearsModel> getAllAcademicYear() async {
    try {
      var response = await DioHelper().get(EndPoint.academiYears);
      return AcdemicYearsModel.fromJson(response);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AcdemicYearResponseModel> getAcademicYearById(
      {required int id}) async {
    try {
      var response = await DioHelper().get(EndPoint.getFullAcademiYear(id: id));
      return AcdemicYearResponseModel.fromJson(response);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
