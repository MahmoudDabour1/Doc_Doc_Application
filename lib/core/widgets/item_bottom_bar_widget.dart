import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class ItemBottomBarItem extends StatelessWidget {
  const ItemBottomBarItem(
      {super.key,
      required this.icon,
      required this.isSelected,
      required this.onPress});

  final IconData icon;
  final bool isSelected;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child:Icon(icon,size: 24.w,color:isSelected?AppColors.normalBlue100:AppColors.normalGray80 ),
    );
  }
}
