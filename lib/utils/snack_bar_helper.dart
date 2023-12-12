import 'package:flutter/material.dart';

import 'constant.dart';

class SnackBarHelper {
  SnackBarHelper._();
  static SnackBarHelper? _instance;

  static SnackBarHelper get instance => _instance ??= SnackBarHelper._();

  showMessage(
      {required String message, int milliseconds = 40, bool erro = false}) {
    ScaffoldMessenger.of(navigatorKey.currentState!.context)
        .showSnackBar(SnackBar(
      elevation: 0.0,
      backgroundColor: erro ? Colors.deepOrange : Colors.deepPurple,
      //behavior: SnackBarBehavior.floating,

      content: Text(message),
      duration: Duration(milliseconds: milliseconds),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      ),
      //backgroundColor: Colors.redAccent,
      // action: SnackBarAction(
      //   textColor: Color(0xFFFAF2FB),
      //   label: 'OK',
      //   onPressed: () {},
      // ),
    ));
  }
}
