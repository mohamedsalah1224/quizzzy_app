// update_account_view
// UpdateAccountViewModel
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/local/cache_user_service.dart';
import 'package:quizzy_app/model/user_model.dart';

class UpdateAccountViewModel extends GetxController {
  late User _user;

  late TextEditingController _nameController;
  late TextEditingController _userNameController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  ///////////////////////////////////////////////// Service /////////////////////////////////////////////////

  void _getUserFromCahce() async {
    _user = CacheUserService.instance.getUser();
    // to cache the User Object
  }

  Future<void> updateUserCache({required User userValue}) async {
    _user = userValue;
    await CacheUserService.instance
        .updateUser(user: userValue); // to cache the User Object
  }
}
