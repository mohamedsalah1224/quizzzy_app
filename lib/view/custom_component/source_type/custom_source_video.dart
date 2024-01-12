import 'package:flutter/material.dart';

class CustomSourceVideo extends StatelessWidget {
  const CustomSourceVideo({super.key, this.fileSourceLink});
  final String? fileSourceLink;

  @override
  Widget build(BuildContext context) {
    return fileSourceLink != null
        ? Text("CustomSourceVideo")
        : const SizedBox();
  }
}
