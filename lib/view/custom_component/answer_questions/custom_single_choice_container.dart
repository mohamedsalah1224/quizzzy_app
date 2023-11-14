import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_text.dart';

class CustomSingleChoiceContainer extends StatelessWidget {
  final String text;
  final Color color;
  const CustomSingleChoiceContainer(
      {super.key, required this.text, this.color = Colors.amber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144.w,
      height: 90.h,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          //rgba(0, 0, 0, 0.25)
          color: color,
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 5),
                spreadRadius: 0,
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 0.25)),
          ],
          borderRadius: BorderRadius.circular(17).r),
      child: CustomText(
        text: text,
        fontFamily: "Cairo",
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
    );
  }
}
