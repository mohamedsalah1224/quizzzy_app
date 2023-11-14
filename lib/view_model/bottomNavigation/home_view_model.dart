import 'dart:async';

import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  String? text;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(Duration(seconds: 10), () => updateData());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("close Home Controller");
  }

  void updateData() {
    text = "Mohamed";
    update();
  }
}
