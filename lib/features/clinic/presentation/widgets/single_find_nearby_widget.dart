import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:doc_doc_application/core/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/networks/api_constance.dart';

class SingleFindNearbyWidget extends StatelessWidget {
  const SingleFindNearbyWidget(
      {super.key, required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Container(
        width: double.infinity,
        height: 110.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.normalGray30,
            border: Border.all(color: AppColors.normalGray60,width: 2)
        ),
        child:Row(
          children: [
            Image.network(
              ApiConstance.baseImageUrl+image??'',
              fit: BoxFit.fill,
              width: 110.w,
              height: 110.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: AppColors.normalBlack,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, bottom: 12.h),
                    child: SizedBox(
                      width: 180.w,
                      child: Text(
                        "${AppString.dr} | ${AppString.rsud}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: AppColors.normalGray60,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.normalYellow,
                        size: 20.r,
                      ),
                      Text(
                        "${AppString.rate} ${AppString.reviews}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: AppColors.normalGray60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

      ),

    );
  }
}
