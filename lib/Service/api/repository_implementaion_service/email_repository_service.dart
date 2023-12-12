import 'package:dio/dio.dart';
import 'package:quizzy_app/Service/Networking/dio_exception.dart';
import 'package:quizzy_app/Service/Networking/dio_helper.dart';
import 'package:quizzy_app/Service/api/repository/email_repository.dart';
import 'package:quizzy_app/model/genral_response_mode.dart';
import 'package:quizzy_app/model/resend_verify_email_model.dart';
import 'package:quizzy_app/utils/end_point.dart';

class EmailRepositoryService implements EmailRepository {
  @override
  Future<ReSendVeifyEmailModel> reSendVerifyEmail(
      {required String email}) async {
    try {
      var response = await DioHelper()
          .post(EndPoint.reSendVeifyEmail, data: {'email': email});
      return ReSendVeifyEmailModel.fromJson(response);
    } on DioException catch (e) {
      throw DioExceptionHelper.instance.getExceptionMessage(dioException: e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GeneralResponseModel> verifyEmailCode(
      {required String email, required String code}) async {
    try {
      var response = await DioHelper()
          .post(EndPoint.veifyEmailCode, data: {'email': email, 'code': code});
      return GeneralResponseModel.fromJson(response);
    } on DioException catch (e) {
      throw DioExceptionHelper.instance.getExceptionMessage(dioException: e);
    } catch (e) {
      rethrow;
    }
  }
}
