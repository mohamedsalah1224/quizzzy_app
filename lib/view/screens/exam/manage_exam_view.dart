import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_images.dart';
import '../../../view_model/exam/manage_exam_view_model.dart';
import '../../custom_component/custom_text.dart';

class ManageExamView extends GetView<ManageExamViewModel> {
  const ManageExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          text: "الاختبارات",
          fontFamily: "Cairo",
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          color: Colors.black,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(
            Assets.imagesMenu,
            color: Colors.black,
          ),
          onPressed: () {
            print("Ok");
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              Assets.imagesNotification,
              color: Colors.black,
            ),
            onPressed: () {
              print("Ok");
            },
          ),
        ],
      ),
      body: GetBuilder<ManageExamViewModel>(
        builder: (context) {
          return controller.examViewList[controller.currentIndex];
        },
      ),
    );
  }
}
