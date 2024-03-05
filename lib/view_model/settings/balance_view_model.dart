import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quizzy_app/Service/api/repository/profile_repository.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/profile_repository_service.dart';
import 'package:quizzy_app/model/user_model.dart';
import 'package:quizzy_app/utils/dialogs/custom_dialog_balance_widget.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';
import 'package:quizzy_app/view_model/settings/settings_view_model.dart';

class BalanceViewModel extends GetxController {
  late User _user;
  TextEditingController _textEditingController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController get textEditingController => _textEditingController;
  GlobalKey<FormState> get formKey => _formKey;

  int get balance => _user.balance ?? 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _user = Get.arguments;
  }

  ///////////////////////////////// Service ////////////////////////////////////////

  void rechargeAccount({required String code}) {
    PofileRepositoryService().rechargeAccount(code: code).then((value) {
      if (value.success!) {
        updateCache(value.data!);
        SnackBarHelper.instance.showMessage(
          isEnglish: false,
          message: value.message!,
        );
        update(['updateBalance']);
      } else {
        SnackBarHelper.instance.showMessage(
          erro: true,
          isEnglish: false,
          message: "الكوبون خطأ",
        );
      }
    });
  }

  void updateCache(User userValue) async {
    _user = userValue;
    await Get.find<SettingsViewModel>().updateUserCache(userValue: userValue);
  }

///////////////////////////////////////////////////////////////////////////////////////

  String? validateBalanceController(String? value) {
    if (value == null || value.isEmpty) {
      return "يرجي ادخال الكوبون";
    } else {
      return null;
    }
  }

  void showAlertDialog(BuildContext context) async {
    _textEditingController.clear(); // at the End
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomDialogBalance();
        });
  }

  void cancel() {
    Get.back();
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      rechargeAccount(code: _textEditingController.text.trim());
      Get.back();
    }
  }
}
// SettingsBinding