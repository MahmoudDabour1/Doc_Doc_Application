import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:page_transition/page_transition.dart';

import 'app_colors.dart';

final navigatorKey = GlobalKey<NavigatorState>();

//  navigatorTo({required BuildContext context, required Widget page, bool withHistory = false}) {
//   Navigator.push(
//     context,
//
//     MaterialPageRoute(
//       builder: (context) => page,
//     ),
//   );
// }



navigatorTo(
    {required BuildContext context,
    required Widget page,
    bool withHistory = true, PageTransitionType pageTransitionType = PageTransitionType.fade}) {
  Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
          child: page,
          type: pageTransitionType,
          duration: const Duration(milliseconds: 400)),
      (route) => withHistory);
}
showToast({required String msg, Color color = Colors.blue}) {
  Fluttertoast.showToast(
    msg: msg,
    fontSize: 16.sp,
    backgroundColor: color,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    textColor: AppColors.normalWhite,
    toastLength: Toast.LENGTH_SHORT,
  );
}

showMessage({required String msg}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: Colors.grey.withOpacity(0.5),
      elevation: 0,
      content: Row(
        children: [
          const Icon(
            Icons.message_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                msg,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
