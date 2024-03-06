import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quizzy_app/Service/Networking/dio_exception.dart';
import 'package:quizzy_app/Service/Networking/dio_helper.dart';
import 'package:quizzy_app/Service/api/repository/profile_repository.dart';
import 'package:quizzy_app/model/profile_model.dart';

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
      {String? name, String? userName, String? password, String? photo}) async {
    // Check how to Send a File to Server photo
    try {
      var reponse = await DioHelper().post(EndPoint.updateProfile, data: {
        if (name != null) 'name': name,
        if (userName != null) 'username': userName,

        if (password != null) 'password': password,
        if (photo != null) 'photo': photo, // check Photo File
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
