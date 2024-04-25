import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget(
      {super.key,
      required this.height,
      required this.width,
      this.isCircular = false});

  final double height;
  final double width;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 4.h),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
             shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            color: AppColors.normalGray20,
            borderRadius:isCircular?null: BorderRadius.circular(6.r)
          ),
        ),
      ),
    );
  }
}
