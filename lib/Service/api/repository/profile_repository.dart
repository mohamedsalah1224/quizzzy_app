import 'package:quizzy_app/model/profile_model.dart';
import 'package:quizzy_app/model/register_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getProfile();
  Future<ProfileModel> updateProfile({required RegisterModel registerModel});
  Future<ProfileModel> rechargeAccount({required String code});
  deleteProfile();
  forgetPassword();
  resetPassword();
}
