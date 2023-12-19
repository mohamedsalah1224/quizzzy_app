import 'package:flutter/material.dart';
import 'package:quizzy_app/Service/Firebase/social_service/repository/social_repository.dart';
import 'package:quizzy_app/model/social_service_response_model.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookRepositoryService implements SocialRepository {
  @override
  Future<SocialServiceResponseModel> login() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status == LoginStatus.success) {
        // you are logged
        final AccessToken accessToken = loginResult.accessToken!;

        return SocialServiceResponseModel(
            status: true,
            providerId: accessToken.applicationId,
            providertype: 'facebook',
            message: 'Login  Successful with Facebook');
      } else {
        debugPrint(loginResult.message.toString());
        return SocialServiceResponseModel(
            status: false,
            message:
                'Login Error with Facebook \n reason:${loginResult.message.toString()}');
      }
    } catch (e) {
      return SocialServiceResponseModel(
          status: false, message: 'Login Error with Facebook');
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await FacebookAuth.instance.logOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
