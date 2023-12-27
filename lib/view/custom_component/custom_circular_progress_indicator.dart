import 'package:flutter/material.dart';
import 'package:quizzy_app/utils/constant.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: Colors.white,
      color: primayColor,
    ));
  }
}
