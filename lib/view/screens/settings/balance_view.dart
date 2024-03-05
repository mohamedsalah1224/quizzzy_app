import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';

class BalanceView extends StatelessWidget {
  const BalanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: REdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomText(text: "رصيدي"),
          ],
        ),
      ),
    );
  }
}
