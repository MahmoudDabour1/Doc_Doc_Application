import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_doc_application/core/networks/api_constance.dart';
import 'package:doc_doc_application/core/utils/app_images.dart';
import 'package:doc_doc_application/core/utils/app_string.dart';
import 'package:doc_doc_application/core/utils/cache_Helper.dart';
import 'package:doc_doc_application/core/utils/helper_method.dart';
import 'package:doc_doc_application/core/widgets/button_widget.dart';
import 'package:doc_doc_application/features/user/personal_information/presentation/screens/view.dart';
import 'package:doc_doc_application/features/user/profile/data/data_sources/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/shimmer_widget.dart';
import '../../../../auth/login/presentation/screens/view.dart';
import '../controller/profile_cubit.dart';
import '../widgets/bottom_details_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.normalBlue100,
        title: Text(
          AppString.profile,
          style: TextStyle(
            color: AppColors.normalWhite,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              size: 25.r,
              color: AppColors.normalWhite,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.normalBlue100,
      body: BlocProvider(
        create: (context) => ProfileCubit(sl())..getProfileData(),
        child: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {
            if (state is ProfileFailedState) {
              showToast(msg: "Please Try Again", color: Colors.red);
            }
            if (state is ProfileSuccessState) {
              CacheHelper.saveFirstName(state.profileModel.firstName);
              CacheHelper.saveLastName(state.profileModel.lastName);
              CacheHelper.savePhone(state.profileModel.phone);
            }
          },
          buildWhen: (previous, current) {
            return previous != current && current is ProfileSuccessState;
          },
          builder: (context, state) {
            var cubit = ProfileCubit.get(context);
            return RefreshIndicator(
              displacement: 75.h,
              backgroundColor: AppColors.normalBlue100,
              color: AppColors.normalWhite,
              strokeWidth: 2,
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                await cubit.getProfileData();
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 100.h),
                          child: Container(
                            width: double.infinity,
                            height: 620.h,
                            decoration: BoxDecoration(
                              color: AppColors.normalWhite,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.r),
                                topRight: Radius.circular(24.r),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80.h,
                                ),
                                state is ProfileLoadingState
                                    ? ShimmerWidget(
                                        width: 170.w,
                                        height: 10.h,
                                      )
                                    : Text(
                                        "${ProfileData.profileModel!.firstName} ${ProfileData.profileModel!.lastName}",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          color: AppColors.normalBlack,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                state is ProfileLoadingState
                                    ? ShimmerWidget(
                                        height: 10.h,
                                        width: 150.w,
                                      )
                                    : Text(
                                        ProfileData.profileModel!.email,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.normalGray60,
                                            fontWeight: FontWeight.w400),
                                      ),
                                BottomDetailsWidget(
                                  text: AppString.personalInformation,
                                  onTap: () {
                                    ProfileData.profileModel;
                                    navigatorTo(
                                        context: context,
                                        page:
                                            const PersonalInformationScreen());
                                  },
                                  image: AppImage.personal,
                                ),
                                BottomDetailsWidget(
                                  text: AppString.myTest,
                                  onTap: () {},
                                  image: AppImage.test,
                                ),
                                BottomDetailsWidget(
                                  text: AppString.payment,
                                  onTap: () {},
                                  image: AppImage.payment,
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                ButtonWidget(
                                    btnController: btnController,
                                    text: "LogOut",
                                    function: () {
                                      navigatorTo(
                                        context: context,
                                        page: const LoginScreen(),
                                        withHistory: false,
                                      );
                                      CacheHelper.clear();
                                    })
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: state is ProfileLoadingState
                              ? ShimmerWidget(
                                  height: 120.h,
                                  width: 120.w,
                                  isCircular: true,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.normalGray80,
                                    shape: BoxShape.circle,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  height: 120.h,
                                  width: 120.h,
                                  child: ProfileData.profileModel!.image != null
                                      ? CachedNetworkImage(
                                          imageUrl:
                                              "${ApiConstance.baseImageUrl}${ProfileData.profileModel!.image}",
                                          fit: BoxFit.fill,
                                        )
                                      : Image.asset(
                                          AppImage.avatar,
                                          fit: BoxFit.fill,
                                        ),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
