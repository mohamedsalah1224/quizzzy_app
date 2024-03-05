// update_account_view
// UpdateAccountViewModel
import 'package:get/get.dart';
import 'package:quizzy_app/model/user_model.dart';

class UpdateAccountViewModel extends GetxController {
  late User _user;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _user = Get.arguments;
  }
}
