import 'package:doc_doc_application/core/networks/api_constance.dart';
import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SingleDoctorSpecialityWidget extends StatelessWidget {
  const SingleDoctorSpecialityWidget(
      {super.key, required this.name, required this.image});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 56.h,
            width: 56.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.normalGray20,
            ),
            child: Center(
              child: image.substring(image.length - 3) == "svg"
                  ? SvgPicture.network(
                      ApiConstance.baseImageUrl + image,
                      width: 39.w,
                      height: 39.h,
                    )
                  : Image.network(
                      ApiConstance.baseImageUrl + image,
                      width: 39.w,
                      height: 39.h,
                    ),

              // Image.network(ApiConstance.baseImageUrl+image,fit: BoxFit.fill,),
              // SvgPicture.network( ApiConstance.baseImageUrl+image,
              //   fit: BoxFit.fill,
              // ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            name,
            style: TextStyle(
              color: AppColors.normalGray100,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
