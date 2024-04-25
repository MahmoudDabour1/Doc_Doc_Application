import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../utils/app_colors.dart';
import '../utils/app_string.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      decoration: InputDecoration(
        hintText: AppString.phone,
        hintStyle: TextStyle(
          color: AppColors.normalGray60,
          fontSize: 14.sp,
        ),
        filled: true,
        fillColor: AppColors.normalGray20,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.sp),
        ),
      ),
    );
  }
}
