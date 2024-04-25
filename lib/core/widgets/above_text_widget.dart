import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class AboveTextWidget extends StatelessWidget {
  const AboveTextWidget({super.key, required this.titleText, required this.subTitleText});
  final String titleText;
  final String subTitleText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 94.h,
        ),
        Text(
          titleText,
          style: TextStyle(
            color: AppColors.normalBlue100,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          subTitleText,
          style: TextStyle(
            color: AppColors.normalBody,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: 36.h,
        ),
      ],
    );
  }
}
