import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final AlignmentGeometry? alignment;
  final TextAlign? textAlign;
  final int? maxLines;
  const CustomText(
      {super.key,
      required this.text,
      this.alignment,
      this.color,
      this.fontSize,
      this.maxLines = 4,
      this.textAlign,
      this.fontFamily,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text,
          textAlign: textAlign,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
          style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight)),
    );
  }
}
