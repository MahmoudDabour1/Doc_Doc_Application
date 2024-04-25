// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/app_images.dart';
//
// class ImageContainerWidget extends StatelessWidget {
//    ImageContainerWidget({super.key});
//   File? myImage;
//
//   @override
//   Widget build(BuildContext context) {
//     return   Container(
//       decoration: BoxDecoration(
//         color: AppColors.normalGray80,
//         shape: BoxShape.circle,
//       ),
//       clipBehavior: Clip.antiAlias,
//       height: 120.h,
//       width: 120.h,
//       child: myImage != null
//           ? Image.file(
//        myImage!,
//         fit: BoxFit.fill,
//       )
//           : Image.asset(
//         AppImage.avatar,
//       ),
//     );
//   }
// }
