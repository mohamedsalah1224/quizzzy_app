import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quizzy_app/Service/Networking/dio_exception.dart';
import 'package:quizzy_app/Service/Networking/dio_helper.dart';
import 'package:quizzy_app/Service/api/repository/profile_repository.dart';
import 'package:quizzy_app/model/profile_model.dart';
import 'package:quizzy_app/model/register_model.dart';
import 'package:quizzy_app/model/validation_erro_model.dart';
import 'package:quizzy_app/utils/end_point.dart';

class PofileRepositoryService implements ProfileRepository {
  @override
  Future<ProfileModel> getProfile() async {
    try {
      var response = await DioHelper().get(EndPoint.profile);
      return ProfileModel.fromJson(response);
    } on DioException catch (e, s) {
      debugPrint(s.toString());
      throw DioExceptionHelper.instance.getExceptionMessage(dioException: e);
    } catch (e, s) {
      debugPrint(s.toString());
      rethrow;
    }
  }

  @override
  Future<ProfileModel> rechargeAccount({required String code}) async {
    try {
      var reponse = await DioHelper().post(EndPoint.rechargeAccount, data: {
        'code': code,
      });

      return ProfileModel.fromJson(reponse);
    } on DioException catch (e, s) {
      debugPrint(s.toString());
      throw ValidationErroModel.fromJson(e.response!.data).message.toString();
    } catch (e, s) {
      debugPrint(s.toString());
      rethrow;
    }
  }

  @override
  Future<ProfileModel> updateProfile(
      {required RegisterModel registerModel}) async {
    // Check how to Send a File to Server photo
    try {
      var reponse = await DioHelper().post(EndPoint.updateProfile, data: {
        'name': registerModel.name,
        'phone': registerModel.phone,
        'email': registerModel.email,
        'password': registerModel.password,
        // 'photo': registerModel.photo, // check Photo File
        'academic_year_id': registerModel.academicYearId,
        'provider_id': registerModel.providerId,
        'provider_type': registerModel.providerType,
        'date_of_birth': registerModel.dateOfBirth,
        'device_token': registerModel.deviceToken,
        'username': registerModel.username,
        'governorate': registerModel.governorate,
        'area': registerModel.area,
        'residence_area': registerModel.residenceArea,
        'specialization': registerModel.specialization,
        'location_area': registerModel.locationArea,
        'phone_verified': null
      });

      return ProfileModel.fromJson(reponse);
    } on DioException catch (e, s) {
      debugPrint(s.toString());
      throw ValidationErroModel.fromJson(e.response!.data).message.toString();
    } catch (e, s) {
      debugPrint(s.toString());
      rethrow;
    }
  }

  @override
  deleteProfile() {
    // TODO: implement deleteProfile
    throw UnimplementedError();
  }

  @override
  forgetPassword() {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
