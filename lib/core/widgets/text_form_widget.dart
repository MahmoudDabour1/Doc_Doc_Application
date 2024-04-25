import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormWidget extends StatefulWidget {
  TextFormWidget({
    super.key,
    required this.controller,
    required this.text,
    this.validation,
    this.keyboardType = TextInputType.text,
    this.isLastInput = false,
    this.isPassword = false,
    this.enable = true,
    this.onTap,
    this.onSaved,
  });

  final TextEditingController controller;
  final String text;
  final validation;
  bool isLastInput, isPassword, enable;

  final TextInputType keyboardType;
  void Function()? onTap;
  void Function(String?)? onSaved;

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validation,
      obscureText: widget.isPassword && isHidden,
      textAlign: TextAlign.start,
      onTap: widget.onTap,
      enabled: widget.enable,
     onSaved:widget.onSaved ,
      textInputAction:
          widget.isLastInput ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        hintText: widget.text,
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
        suffixIcon: widget.isPassword? GestureDetector(onTap: (){
          isHidden = !isHidden;
          setState((){});
        },
          child: Icon(isHidden?Icons.visibility_off: Icons.visibility),):null,
      ),
    );
  }
}
