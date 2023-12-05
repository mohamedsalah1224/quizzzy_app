import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_images.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final String? labelText;
  bool obscureText;
  final bool? eyes;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? initialValue;
  final Color? iconColor;
  final bool readOnly;
  final void Function()? onTap;
  final double? height;
  final TextDirection? textDirection;
  final TextAlignVertical? textAlignVertical;
  CustomTextFormField(
      {super.key,
      required this.icon,
      this.eyes,
      this.onTap,
      this.initialValue,
      this.validator,
      this.height,
      this.textAlignVertical,
      this.textDirection,
      this.obscureText = false,
      this.onSaved,
      this.readOnly = false,
      this.iconColor,
      this.hintText,
      this.controller,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              height: height,
              child: TextFormField(
                textDirection: textDirection,
                controller: controller,
                obscureText: obscureText,
                onSaved: onSaved,
                onTap: onTap,
                initialValue: initialValue,
                validator: validator,
                textAlignVertical: textAlignVertical,
                readOnly: readOnly,
                decoration: InputDecoration(
                    hintText: hintText,
                    floatingLabelBehavior: FloatingLabelBehavior
                        .always, // to show the label in above always
                    hintStyle:
                        TextStyle(fontSize: 12, color: Color(0xff727272)),
                    suffixIcon: eyes == null
                        ? icon == null
                            ? null
                            : Icon(
                                icon,
                                color: iconColor == null
                                    ? Color(0xff616161)
                                    : iconColor,
                              )
                        : getImage(
                            show: obscureText,
                            onTap: () {
                              setState(() => obscureText = !obscureText);
                            }),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(0xff077C58),
                          width: 2,
                        )),
                    errorBorder: OutlineInputBorder(
                        // wehen erro occure
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 1,
                        )),
                    border: OutlineInputBorder(
                        // when focus in erro
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 1,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          // color: Color(0xff077C58),
                          width: 1,
                        )),
                    labelText: labelText,
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getImage({required bool show, required void Function()? onTap}) =>
      InkWell(
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        child: Icon(
          !show ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: Color(0xff077C58),
        ),
        onTap: onTap,
      );
}
