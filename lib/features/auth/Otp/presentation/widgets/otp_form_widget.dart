import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpFormWidget extends StatelessWidget {
   OtpFormWidget({super.key,});
  final controller = TextEditingController();
   String number = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 80.h,
      child: TextFormField(
        controller:controller,
        onChanged: (value){
          number = number+value;
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: TextStyle(
          color: AppColors.normalBlack,
          fontWeight: FontWeight.bold,
          fontSize: 22.sp,
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          hintText: "ـــــــــ",
          hintStyle: TextStyle(
            color: AppColors.normalGray60,
          ),
          fillColor: AppColors.normalGray30,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
        ),
      ),
    );
  }
}
