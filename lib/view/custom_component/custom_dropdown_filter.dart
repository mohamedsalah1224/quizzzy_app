import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownFilter extends StatelessWidget {
  final String? value;
  final void Function(String?)? onChanged;
  final List<String>? items;
  final String defaultValue;
  final Color borderColor;
  const CustomDropDownFilter(
      {super.key,
      required this.onChanged,
      required this.value,
      required this.defaultValue,
      required this.borderColor,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 45.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8).r,
          border: Border.all(color: borderColor, width: 2.r)),
      padding: const EdgeInsets.all(5).r,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButton(
            value: value,
            hint: Text(
              defaultValue,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5).w,
            isExpanded: true,
            iconEnabledColor: borderColor,
            underline: Text(""),
            onChanged: onChanged,
            items: items!
                .map((e) => DropdownMenuItem(
                      child: Text("$e"),
                      value: e,
                      alignment: AlignmentDirectional.centerEnd,
                    ))
                .toList()),
      ),
    );
  }
}
