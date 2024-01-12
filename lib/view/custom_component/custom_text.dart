import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final AlignmentGeometry? alignment;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDirection? textDirection;
  const CustomText(
      {super.key,
      required this.text,
      this.alignment,
      this.color,
      this.fontSize,
      this.textDirection,
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
          textDirection: textDirection,
          style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight)),
    );
  }
}
