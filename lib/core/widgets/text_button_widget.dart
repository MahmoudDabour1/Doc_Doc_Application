import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextButtonWidget extends StatelessWidget {
  TextButtonWidget({super.key, required this.text, required this.function});

  final String text;
  void Function() function;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.normalBlue100,
        ),
      ),
    );
  }
}
