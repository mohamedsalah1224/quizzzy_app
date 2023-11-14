import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final void Function()? onTap;

  const CustomButton(
      {super.key,
      required this.text,
      this.fontFamily,
      required this.onTap,
      this.fontSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity.w,
        height: 50.h,
        alignment: AlignmentDirectional.center,
        padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 4.h),
        decoration: BoxDecoration(
          color: Color(0xff268C6D),
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: CustomText(
          text: text,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: Colors.white,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
