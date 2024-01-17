import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';

class CustomCircleSumOfPointInformation extends StatelessWidget {
  final String sumOfPoint;
  const CustomCircleSumOfPointInformation(
      {super.key, required this.sumOfPoint});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: REdgeInsets.only(bottom: 35),
          decoration: BoxDecoration(
            // rgba(255, 255, 255, 0.25)

            border: Border.all(
                color: const Color.fromRGBO(255, 255, 255, 0.25),
                // strokeAlign: ,

                width: 20),
            shape: BoxShape.circle,
          ),
          child: Container(
            width: 150.w,
            height: 150.w,
            decoration: BoxDecoration(
                // rgba(255, 255, 255, 0.25)
                border: Border.all(
                    color:
                        const Color.fromRGBO(0, 167, 50, 0.20), // inside first
                    // strokeAlign: ,

                    width: 15),
                shape: BoxShape.circle,
                color: const Color.fromRGBO(255, 255, 255, 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'مجموع نقاطك',
                  fontFamily: 'Cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff268C6D),
                ),
                CustomText(
                  text: '$sumOfPoint pt',
                  fontFamily: 'DMSans',
                  fontSize: sumOfPoint.length > 3 ? 16.sp : 32.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff268C6D),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
