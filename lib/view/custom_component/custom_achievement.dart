import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomAchievement extends StatelessWidget {
  final int number;
  final String text;
  final String assetImage;
  final bool isMedal;
  const CustomAchievement(
      {super.key,
      required this.number,
      required this.text,
      this.isMedal = false,
      required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136.w,
      height: 89.h,
      padding: EdgeInsets.only(top: 15.h, right: 15.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), color: Colors.amber),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                text: "$number",
                fontFamily: "Cairo",
                fontWeight: FontWeight.w800,
                fontSize: 15.sp,
              ),
              CustomText(
                text: "$text",
                fontFamily: "Cairo",
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              ),
            ],
          ),
          15.horizontalSpace,
          Padding(
            padding: const EdgeInsets.only(top: 10).h,
            child: Image.asset(
              assetImage,
              cacheHeight: 34.w.toInt(),
              cacheWidth: 34.h.toInt(),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
