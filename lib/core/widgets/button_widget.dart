import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {super.key,
      required this.text,
      required this.function,
      required this.btnController});

  final String text;
  void Function()? function;
  RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      borderRadius: 16.r,
      color: AppColors.normalBlue100,
      height: 52.h,
      width: 311.w,
      completionDuration: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 400),
      failedIcon: Icons.dangerous,
      successIcon: Icons.done,
      errorColor: Colors.red,
      successColor: Colors.green,
      controller: btnController,
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.normalWhite,
        ),
      ),
    );
    /*ElevatedButton(
            onPressed: function,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.normalBlue100,
              fixedSize: Size(311.w, 52.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.normalWhite,
              ),
            ),
          );*/
  }

  Widget buildSmallButton(bool isDone) {
    return isDone
        ? Icon(
            Icons.done,
            size: 52.r,
            color: Colors.white,
          )
        : Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDone ? Colors.green : AppColors.normalBlue100),
            child: const Center(child: CircularProgressIndicator()),
          );
  }
}

enum ButtonState { init, loading, done }
