import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/view/custom_component/custom_text.dart';

class CustomRadioButton extends StatelessWidget {
  final String text;
  final int value;
  final int groupValue;
  final void Function(int?)? onChanged;
  final Color? activeColor;
  const CustomRadioButton(
      {super.key,
      required this.text,
      required this.value,
      required this.onChanged,
      this.activeColor = const Color(0xff268C6D),
      required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      height: 40.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: RadioListTile(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            contentPadding: const EdgeInsets.all(0),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: value,
            title: CustomText(
              text: text,
              fontFamily: "inter",
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
            groupValue: groupValue,
            activeColor: activeColor,
            onChanged: onChanged),
      ),
    );
  }
}
