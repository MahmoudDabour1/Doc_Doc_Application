import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:doc_doc_application/core/utils/app_string.dart';
import 'package:doc_doc_application/core/utils/helper_method.dart';
import 'package:doc_doc_application/features/auth/login/presentation/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../core/utils/app_images.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 33.h,
          ),
          Padding(
            padding: EdgeInsets.only(top: 33.h, bottom: 40.h),
            child: Image.asset(
              AppImage.namedSplah,
              height: 19.h,
              width: 95.57.w,
            ),
          ),
          Stack(
            children: [
              Center(child: Image.asset(AppImage.backgroundSplah)),
              Center(child: Image.asset(AppImage.doctor)),
              Padding(
                padding: EdgeInsets.only(top: 260.h),
                child: Image.asset(AppImage.effect),
              ),
              Padding(
                padding: EdgeInsets.only(top: 432.h),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    AppString.bestDoctor,
                    style: TextStyle(
                      color: AppColors.normalBlue100,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 18.h),
          Text(
            AppString.manage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.normalBody,
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          SwipeButton(
            width: 300,
            activeThumbColor: AppColors.normalBlue100,
            activeTrackColor: AppColors.normalGray50,
            borderRadius: BorderRadius.circular(20.r),
            child: Text(
              "Swipe to Start",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            onSwipe: () {
                navigatorTo(context: context, page: const LoginScreen());
            },
          ),

          // ButtonWidget(
          //   btnController:btnController ,
          //   text: AppString.getStarted,
          //   function: () {
          //      navigatorTo(context: context, page: const LoginScreen());
          //   },
          // )
        ],
      ),
    );
  }
}
