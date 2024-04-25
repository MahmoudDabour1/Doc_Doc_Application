import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:doc_doc_application/core/utils/app_images.dart';
import 'package:doc_doc_application/core/widgets/item_bottom_bar_widget.dart';
import 'package:doc_doc_application/features/appointment/presentation/screens/view.dart';
import 'package:doc_doc_application/features/clinic/presentation/screens/save_clinic_screen.dart';
import 'package:doc_doc_application/features/home/home_screen/presentation/screens/view.dart';
import 'package:doc_doc_application/features/message/presentation/screens/view.dart';
import 'package:doc_doc_application/features/search/presentation/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../features/user/profile/presentation/screens/view.dart';

class BottomBarScreen extends StatefulWidget {
   BottomBarScreen({super.key , this.selectItem = 0});
  int selectItem = 0;
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {


  List<IconData> icons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.message,
    FontAwesomeIcons.calendarDays,
    FontAwesomeIcons.userDoctor,
  ];

  List<String> images = [
    AppImage.home,
    AppImage.message,
    AppImage.calendar,
    AppImage.profile,
  ];
  List<String> images2 = [
    AppImage.home2,
    AppImage.message2,
    AppImage.calendar2,
    AppImage.profile,
  ];

  final pages = [
    const HomeScreen(),
    const SaveClinicScreen(),
     AppointmentScreen(),
    const ProfileScreen(),
    const SearchScreen(),
  ];

  void changeBottomBar(index) {
    widget.selectItem = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: pages[widget.selectItem],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 60.h,
        width: 60.w,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
          onPressed: () {
            changeBottomBar(widget.selectItem = 4);
          },
          backgroundColor: AppColors.normalBlue100,
          elevation: 10,
          child: Image.asset(
            AppImage.search,
            width: 24.w,
            height: 24.h,
          ),


        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
          surfaceTintColor:AppColors.normalBlue100,
          color: AppColors.normalWhite,
           shape: const CircularNotchedRectangle(),
           notchMargin: 8.r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              icons.length,
              (index) => ItemBottomBarItem(
                icon: icons[index],
                isSelected: index == widget.selectItem,
                onPress: () {
                  changeBottomBar(index);
                },
              ),
            ),
          ),
        ),

      ),

    );
  }
}
