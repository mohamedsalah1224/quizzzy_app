import 'package:dio/dio.dart';
import 'package:quizzy_app/Service/Networking/dio_helper.dart';
import 'package:quizzy_app/Service/api/repository/auth_repository.dart';
import 'package:quizzy_app/model/auth_model.dart';
import 'package:quizzy_app/model/genral_response_mode.dart';
import 'package:quizzy_app/model/login_model.dart';
import 'package:quizzy_app/model/register_model.dart';
import 'package:quizzy_app/model/social_login_model.dart';
import 'package:quizzy_app/utils/end_point.dart';
import 'package:quizzy_app/utils/general_utils.dart';

class AuthRepositoryService implements AuthRepository {
  static AuthRepositoryService? _instance;
  static AuthRepositoryService get instance =>
      _instance ??= AuthRepositoryService._();

  AuthRepositoryService._();
  @override
  Future<GeneralResponseModel> checkUser({required String value}) async {
    try {
      var response =
          await DioHelper().post(EndPoint.checkUser, data: {'email': value});

      return GeneralResponseModel.fromJson(response);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> login({required LoginModel loginModel}) async {
    try {
      var response = await DioHelper().post(
        EndPoint.login,
        data: {
          'phone': loginModel.phone,
          'email': loginModel.email,
          'password': loginModel.password,
          'type': GeneralUtils.instance
              .convertLoginEnumTypeToString(loginModel.type!),
        },
      );
      return AuthModel.fromJson(response);
    } on DioException {
      rethrow;
      // or throw response['message']
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GeneralResponseModel> logout() async {
    try {
      var response = await DioHelper().post(EndPoint.logout);
      return GeneralResponseModel.fromJson(response); //
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> register({required RegisterModel registerModel}) async {
    try {
      var reponse = await DioHelper().post(EndPoint.register, data: {
        'name': registerModel.name,
        'phone': registerModel.phone,
        'email': registerModel.email,
        'password': registerModel.password,
        'photo': registerModel.photo,
        'academic_year_id': registerModel.academicYearId,
        'provider_id': registerModel.academicYearId,
        'provider_type': registerModel.providerType,
        'date_of_birth': registerModel.dateOfBirth,
        'device_token': registerModel.deviceToken,
        'username': registerModel.username,
        'governorate': registerModel.governorate,
        'area': registerModel.area,
        'residence_area': registerModel.residenceArea,
        'specialization': registerModel.specialization
      });

      return AuthModel.fromJson(reponse);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> socialLogin(
      {required SocialLoginModel socialLoginModel}) async {
    try {
      var reponse = await DioHelper().post(EndPoint.socialLogin, data: {
        'name': socialLoginModel.name,
        'academic_year_id': socialLoginModel.academicYearId,
        'provider_id': socialLoginModel.academicYearId,
        'provider_type': socialLoginModel.providerType,
        'date_of_birth': socialLoginModel.dateOfBirth,
        'device_token': socialLoginModel.deviceToken,
        'username': socialLoginModel.username,
        'governorate': socialLoginModel.governorate,
        'area': socialLoginModel.area,
        'residence_area': socialLoginModel.residenceArea,
        'specialization': socialLoginModel.specialization
      });

      return AuthModel.fromJson(reponse);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
