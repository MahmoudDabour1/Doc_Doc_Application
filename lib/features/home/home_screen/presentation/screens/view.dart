import 'package:doc_doc_application/core/constants/constants.dart';
import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:doc_doc_application/core/utils/app_images.dart';
import 'package:doc_doc_application/core/utils/app_string.dart';
import 'package:doc_doc_application/core/utils/cache_Helper.dart';
import 'package:doc_doc_application/core/utils/helper_method.dart';
import 'package:doc_doc_application/core/widgets/text_button_widget.dart';
import 'package:doc_doc_application/features/clinic/presentation/controller/clinic_cubit.dart';
import 'package:doc_doc_application/features/clinic/presentation/screens/find_nearby_screen.dart';
import 'package:doc_doc_application/features/speciality/presentation/controller/get_speciality_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../core/widgets/custom_google_map.dart';
import '../../../../clinic/presentation/screens/get_doctor_clinics.dart';
import '../../../../speciality/presentation/screens/get_all_speciality_screen.dart';
import '../widgets/doctor_speciality_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = GetSpecialityCubit.get(context);
    var findNearbyCubit = ClinicCubit.get(context);
    return Scaffold(
      backgroundColor: AppColors.normalWhite,
      body: RefreshIndicator(
        displacement: 75.h,
        backgroundColor: AppColors.normalBlue100,
        color: AppColors.normalWhite,
        strokeWidth: 2,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          await cubit.getSpecialityData();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi ${CacheHelper.getFirstName()}",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.normalBlack,
                          ),
                        ),
                        Text(
                          AppString.howAre,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.normalGray80,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48.r),
                        color: AppColors.normalGray20,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_none_outlined,
                          size: 24.r,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Container(
                      width: 343.w,
                      height: 167.h,
                      decoration: BoxDecoration(
                        color: AppColors.normalBlue100,
                        borderRadius: BorderRadius.circular(
                          24.sp,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppString.book,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppColors.normalWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                findNearbyCubit.getCurrentLocation()
                                    .then((value) {
                                  findNearbyCubit.liveLocation();
                                  findNearbyCubit.latitude =
                                      value.latitude;
                                  findNearbyCubit.longitude =
                                      value.longitude;
                                  CacheHelper.saveLatitude(value.latitude);
                                  CacheHelper.saveLatitude(value.longitude);
                                });
                                await findNearbyCubit.findNearbyData();
                                navigatorTo(
                                    context: context,
                                    page: FindNearbyScreen());
                              },
                              child: Text(
                                AppString.findNearby,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.normalBlue100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30.h),
                      child: Image.asset(
                        AppImage.doctorFemale,
                        height: 197.h,
                        width: 136,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.doctorSpeciality,
                      style: TextStyle(
                        color: AppColors.normalGray100,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButtonWidget(text: AppString.seeAll, function: () {
                      navigatorTo(context: context, page: const GetAllSpecialityScreen());
                    }),
                  ],
                ),
                SizedBox(
                  height: 110.h,
                  child: const DoctorSpecialityWidget(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.recommendation,
                      style: TextStyle(
                        color: AppColors.normalGray100,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButtonWidget(text: AppString.seeAll, function: () {}),
                  ],
                ),
                SizedBox(height:300,child: GetDoctorClinic()),
                // const RecommendationDoctorWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
