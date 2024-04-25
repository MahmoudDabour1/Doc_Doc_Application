import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomDetailsWidget extends StatelessWidget {
   BottomDetailsWidget({super.key, required this.image, required this.text,required this.onTap});
  final String image;
  final String text;
  void Function()onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 16.h,),
            Row(
              children: [
                Image.asset(
                  image,
                  height: 40.h,
                  width: 40.w,
                ),
                SizedBox(width: 10.w,),
                Text(
                  text,
                  style: TextStyle(
                    color: AppColors.normalGray80,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            Divider(
              thickness: 1,
              color: AppColors.normalGray30,

            ),
          ],
        ),
      ),
    );
  }
}
