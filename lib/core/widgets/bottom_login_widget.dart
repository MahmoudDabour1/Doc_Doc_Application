import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:doc_doc_application/core/utils/app_string.dart';
import 'package:doc_doc_application/core/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BottomLoginWidget extends StatelessWidget {
  BottomLoginWidget({
    super.key,
    // required this.google,
    // required this.facebook,
    // required this.apple,
    required this.sign,
    required this.text,
    required this.buttonText,
  });

  // void Function() google;
  // void Function() facebook;
  // void Function() apple;
  void Function() sign;
  final String text;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 46.h,
        ),
        // Row(
        //   children: [
        //     Expanded(
        //         child: Divider(
        //       height: 1,
        //       thickness: 2,
        //       color: AppColors.normalGray40,
        //     )),
        //     Text(
        //       AppString.signWith,
        //       style: TextStyle(
        //         fontSize: 15.sp,
        //         fontWeight: FontWeight.w400,
        //         color: AppColors.normalGray60,
        //       ),
        //     ),
        //     Expanded(
        //         child: Divider(
        //       height: 1,
        //       thickness: 2,
        //       color: AppColors.normalGray40,
        //       // indent: 118,
        //     )),
        //   ],
        // ),
        Text(
          AppString.byLogging,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.normalGray60,
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.normalBlack,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextButtonWidget(text: buttonText, function: sign),
          ],
        ),
      ],
    );
  }
}
