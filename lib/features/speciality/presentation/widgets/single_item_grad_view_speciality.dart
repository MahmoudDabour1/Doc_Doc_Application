import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/networks/api_constance.dart';

class SingleItemGradViewSpeciality extends StatelessWidget {
  const SingleItemGradViewSpeciality(
      {super.key, required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.normalGray20,
          ),
          child: Center(
            child: image.endsWith("png")
                ? Image.asset(ApiConstance.baseImageUrl + image,
                    width: 39.w, height: 39.h)
                : SvgPicture.network(
                    ApiConstance.baseImageUrl + image,
                    width: 39.w,
                    height: 39.h,
                  ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          name,
          style: TextStyle(
            color: AppColors.normalGray100,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
