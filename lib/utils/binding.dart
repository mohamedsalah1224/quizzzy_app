import 'package:get/get.dart';
import 'package:quizzy_app/view_model/mange_bottom_navigation_view_model.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => ManageBottomNavigationViewModel());
  }
}
