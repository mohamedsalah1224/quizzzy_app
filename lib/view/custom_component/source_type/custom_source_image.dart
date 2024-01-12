import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/view/custom_component/custom_circular_progress_indicator.dart';

class CustomSourceImage extends StatelessWidget {
  const CustomSourceImage({super.key, this.imageSourceLink});
  final String? imageSourceLink;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 127.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12).r),
        child: CachedNetworkImage(
          fit: BoxFit.fitHeight,
          height: 127.h,
          imageUrl: imageSourceLink ?? "",
          fadeInDuration: const Duration(seconds: 1),
          placeholder: (context, url) =>
              const CustomCircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ));
  }
}
