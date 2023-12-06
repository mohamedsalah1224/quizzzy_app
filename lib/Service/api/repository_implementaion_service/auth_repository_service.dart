import 'package:quizzy_app/Service/Networking/dio_helper.dart';
import 'package:quizzy_app/Service/api/repository/auth_repository.dart';
import 'package:quizzy_app/model/auth_model.dart';
import 'package:quizzy_app/model/login_model.dart';
import 'package:quizzy_app/model/register_model.dart';
import 'package:quizzy_app/model/social_login_model.dart';

class AuthRepositoryService implements AuthRepository {
  @override
  Future<AuthModel> checkUser({required String value}) {
    // TODO: implement checkUser
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> login({required LoginModel loginModel}) {
    throw UnimplementedError();
  }

  @override
  Future<String> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> register({required RegisterModel registerModel}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> socialLogin({required SocialLoginModel socialLoginModel}) {
    // TODO: implement socialLogin
    throw UnimplementedError();
  }
}
