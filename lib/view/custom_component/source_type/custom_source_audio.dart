import 'package:flutter/material.dart';

class CustomSourceAudio extends StatelessWidget {
  const CustomSourceAudio({super.key, this.fileSourceLink});
  final String? fileSourceLink;
  @override
  Widget build(BuildContext context) {
    return fileSourceLink != null
        ? Text("CustomSourceAudio")
        : const SizedBox();
  }
}
