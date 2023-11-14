import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_button.dart';
import '../custom_text.dart';

class CustomBottomViewOfQuestion extends StatelessWidget {
  const CustomBottomViewOfQuestion(
      {super.key,
      required this.onPressedSendNote,
      required this.onTapNextQuestion});
  final void Function()? onPressedSendNote;
  final void Function()? onTapNextQuestion;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75.h,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff268C6D)),
              color: const Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(8.r)),
          padding: const EdgeInsets.symmetric(horizontal: 12).w,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                isCollapsed: true,
                prefixIcon: IconButton(
                  onPressed: onPressedSendNote,
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20.r,
                    color: Color(0xff268C6D),
                  ),
                ),
                border: InputBorder.none,
                hintText: "ارسال ملاحظة....",
                hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff268C6D),
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w400),
                hintTextDirection: TextDirection.rtl),
            textDirection: TextDirection.rtl,
          ),
        ),
        10.verticalSpace,
        StatefulBuilder(
          builder: (context, seState) {
            return Align(
              alignment: AlignmentDirectional.topEnd,
              child: SizedBox(
                width: 180.w,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      value: false,
                      title: CustomText(
                        text: "مشكوك في صحته",
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                      activeColor: Colors.white,
                      activeTrackColor: Color(0xff7EBD4C),
                      onChanged: (value) {
                        seState(() => print(value));
                      }),
                ),
              ),
            );
          },
        ),
        10.verticalSpace,
        CustomButton(
            text: 'التالي',
            fontFamily: "Cairo",
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            onTap: () {
              print("next");
            })
      ],
    );
  }
}
