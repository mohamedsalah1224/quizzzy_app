import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/view/custom_component/custom_alert_message.dart';
import 'package:quizzy_app/view/custom_component/custom_book.dart';
import 'package:quizzy_app/view/custom_component/custom_search_field.dart';

import 'package:quizzy_app/view/custom_component/custom_text.dart';
import 'package:quizzy_app/view_model/exam/manage_exam_view_model.dart';

class ChooseBookView extends GetView<ManageExamViewModel> {
  const ChooseBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("ChooseBookView"),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          text: "الكتب",
          fontFamily: "Cairo",
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          color: Colors.black,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controller.backFromChooseBookView();
          },
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.h),
          child: Column(children: [
            const CustomSearchField(
              text: "البحث عن كتاب",
            ),
            25.verticalSpace,
            CustomText(
              text: "اختر الكتاب",
              fontFamily: "Cairo",
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              alignment: AlignmentDirectional.topEnd,
            ),
            20.verticalSpace,
            Expanded(
              child: GetBuilder<ManageExamViewModel>(
                id: "updateBook",
                builder: (controller) {
                  return controller.bookList.isEmpty
                      ? const CustomAlertMessage(
                          text: "لا يوجد كتب لهذه المادة")
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 50.h,
                                  crossAxisSpacing: 50.w,
                                  crossAxisCount: 2),
                          itemCount: controller.bookList.length,
                          itemBuilder: (context, index) {
                            return CustomBook(
                              bookModel: controller.bookList[index],
                              onTap: () {
                                controller.chooseBook(
                                    bookModel: controller.bookList[index]);
                              },
                            );
                          });
                },
              ),
            ),
          ])),
    );
  }
}
