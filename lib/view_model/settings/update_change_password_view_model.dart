import 'package:get/get.dart';
import 'package:quizzy_app/model/user_model.dart';

class UpdateChangePasswordViewModel extends GetxController {
  late User _user;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _user = Get.arguments;
  }
}
