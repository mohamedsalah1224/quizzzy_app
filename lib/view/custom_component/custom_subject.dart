import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzy_app/model/data_subject_model.dart';
import 'package:quizzy_app/utils/app_images.dart';
import 'package:quizzy_app/utils/general_utils.dart';
import 'package:quizzy_app/view/custom_component/custom_circular_progress_indicator.dart';

import 'custom_text.dart';

class CustomSubject extends StatelessWidget {
  final bool isShowArrow;
  final void Function()? onTap;
  final DataSubjectModel subjectModel;

  const CustomSubject({
    super.key,
    required this.subjectModel,
    this.isShowArrow = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110.w,
        height: 140.h,
        decoration: BoxDecoration(
            color:
                GeneralUtils.instance.generateColor(), // to genearate a Color
            borderRadius: BorderRadius.circular(17).r,
            boxShadow: [
              const BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  blurRadius: 5,
                  offset: const Offset(0, 4))
            ]),
        child: subjectModel.photo == null || subjectModel.photo!.isEmpty
            ? Center(
                child: CustomText(
                  text: subjectModel.name!,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w800,
                  fontSize: 12.sp,
                  color: Colors.white,
                  textAlign: TextAlign.end,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15.w, top: 10.h),
                    child: CustomText(
                      text: subjectModel.name!,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w800,
                      fontSize: 12.sp,
                      color: Colors.white,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  2.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Image.asset(
                      Assets.imagesNextArrow,
                      cacheHeight: 24,
                      cacheWidth: 24,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      width: double.infinity,
                      imageUrl: subjectModel.photo!,
                      fadeInDuration: const Duration(seconds: 1),
                      placeholder: (context, url) =>
                          const CustomCircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Column(
                        children: [
                          Icon(Icons.error),
                          CustomText(
                            text: 'No Image',
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
/*
 Expanded(
                child: Image.asset(
              imageAssetName,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ))
*/