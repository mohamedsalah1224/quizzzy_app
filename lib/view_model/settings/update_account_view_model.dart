// update_account_view
// UpdateAccountViewModel
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/profile_repository_service.dart';
import 'package:quizzy_app/Service/local/cache_user_service.dart';
import 'package:quizzy_app/model/user_model.dart';
import 'package:quizzy_app/utils/form_validator.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';

class UpdateAccountViewModel extends GetxController {
  late User _user;

  late TextEditingController _nameController;
  late TextEditingController _userNameController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? get imageUrl => _user.photo;
  TextEditingController get nameController => _nameController;
  TextEditingController get userNameController => _userNameController;
  GlobalKey<FormState> get formKey => _formKey;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getUserFromCahce();
    _nameController = TextEditingController(text: _user.name);
    _userNameController = TextEditingController(text: _user.username);
  }

  ///////////////////////////////////////////////// Validator /////////////////////////////////////////////////
  String? validateName({String? value}) {
    return FormValidator.instance.anyTextFormValidator(value, "Name");
  }

  String? validateUserName({String? value}) {
    return FormValidator.instance.anyTextFormValidator(value, "User Name");
  }

  void changeAccountInformation() {
    if (formKey.currentState!.validate()) {
      print("Call Service");
    }
  }
  ///////////////////////////////////////////////// Service /////////////////////////////////////////////////

  void _getUserFromCahce() async {
    _user = CacheUserService.instance.getUser();
  }

  Future<void> updateUserCache({required User userValue}) async {
    _user = userValue;
    await CacheUserService.instance
        .updateUser(user: userValue); // to cache the User Object
  }

  void updateProfileService() {
    PofileRepositoryService()
        .updateProfile(
      name: nameController.text,
      userName: userNameController.text,
    )
        .then((value) {
      if (value.success!) {
        SnackBarHelper.instance
            .showMessage(message: 'تم تغيير كلمة السر بنجاح ');
        Get.back();
      } else {
        SnackBarHelper.instance.showMessage(
          message: 'فشل في تغيير كلمة السر ',
          isEnglish: false,
        );
      }
    }).catchError((e) => SnackBarHelper.instance.showMessage(
            message: e.toString(),
            erro: true,
            showByGetx: true,
            isEnglish: false));
  }
}
