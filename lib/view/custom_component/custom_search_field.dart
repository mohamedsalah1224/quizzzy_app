import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_images.dart';

class CustomSearchField extends StatelessWidget {
  final String text;
  const CustomSearchField({super.key, required this.text, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      decoration: BoxDecoration(
          color: const Color(0xffF0F0F0),
          borderRadius: BorderRadius.circular(8.r)),
      padding: const EdgeInsets.symmetric(horizontal: 12).w,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            isCollapsed: true,
            suffixIcon: Image.asset(
              Assets.imagesSearch,
              cacheHeight: 17,
              cacheWidth: 17,
              color: const Color(0xffC6C6C6),
            ),
            border: InputBorder.none,
            hintText: text,
            hintStyle: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xffC6C6C6),
                fontFamily: "Cairo",
                fontWeight: FontWeight.w400),
            hintTextDirection: TextDirection.rtl),
        onChanged: onChanged,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
