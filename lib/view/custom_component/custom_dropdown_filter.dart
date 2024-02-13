import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownFilter extends StatelessWidget {
  final String? value;
  final void Function(String?)? onChanged;
  final List<String>? items;
  final String defaultValue;
  final Color borderColor;
  final Widget? icon;
  final double? height;
  final bool? isSubject;

  const CustomDropDownFilter(
      {super.key,
      required this.onChanged,
      required this.value,
      required this.defaultValue,
      this.icon,
      this.isSubject = false,
      required this.borderColor,
      this.height = 45,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity.w,
      height: height!.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isSubject!
              ? BorderRadius.circular(14).r
              : BorderRadius.circular(8).r,
          border: Border.all(color: borderColor, width: 2.r)),
      padding: isSubject!
          ? const EdgeInsets.symmetric(horizontal: 10).w
          : const EdgeInsets.all(5).r,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButton(
            value: value,
            underline: const SizedBox.shrink(),
            hint: Text(
              defaultValue,
            ),
            padding: !isSubject!
                ? const EdgeInsets.symmetric(horizontal: 5).w
                : null,
            // underline: const Text(""),
            iconEnabledColor: borderColor,
            icon: icon,
            onChanged: onChanged,
            isExpanded: true,
            items: items!
                .map((e) => DropdownMenuItem(
                      child: Text("$e"),
                      value: e,
                      alignment: Alignment.centerRight,
                    ))
                .toList()),
      ),
    );
  }
}
