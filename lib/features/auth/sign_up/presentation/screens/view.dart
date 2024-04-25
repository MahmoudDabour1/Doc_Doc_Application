import 'package:doc_doc_application/core/utils/app_constance.dart';
import 'package:doc_doc_application/core/utils/cache_Helper.dart';
import 'package:doc_doc_application/core/widgets/button_widget.dart';
import 'package:doc_doc_application/core/widgets/circular_progress_widget.dart';
import 'package:doc_doc_application/core/widgets/text_form_widget.dart';
import 'package:doc_doc_application/features/auth/Otp/presentation/screens/view.dart';
import 'package:doc_doc_application/features/auth/sign_up/presentation/controller/sign_up_cubit.dart';
import 'package:doc_doc_application/features/speciality/data/data_sources/get_speciality_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/helper_method.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/above_text_widget.dart';
import '../../../../speciality/data/models/get_speciality_model.dart';
import '../../../../speciality/presentation/controller/get_speciality_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var specialityCubit = GetSpecialityCubit.get(context);
    return Scaffold(
      body: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpFailedState) {
            showToast(msg: state.message, color: Colors.red);
          }
          if (state is SignUpSuccessState) {
            showToast(msg: state.message);
            navigatorTo(
              context: context,
              page: const OtpScreen(),
              withHistory: false,
            );
          }
        },
        builder: (context, state) {
          var cubit = SignUpCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AboveTextWidget(
                      titleText: AppString.createAccount,
                      subTitleText: AppString.signupNow,
                    ),
                    TextFormWidget(
                      controller: cubit.firstNameController,
                      text: AppString.firstName,
                      validation: Validator.nameValidator,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: TextFormWidget(
                        controller: cubit.lastNameController,
                        text: AppString.lastName,
                        validation: Validator.nameValidator,
                      ),
                    ),
                    TextFormWidget(
                      controller: cubit.emailController,
                      text: AppString.email,
                      validation: Validator.emailValidator,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: TextFormWidget(
                        controller: cubit.phoneController,
                        text: AppString.phone,
                        validation: Validator.phoneValidator,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: AppConstance.roleValue,
                      items: AppConstance.role
                          .map(
                            (String item1) => DropdownMenuItem(
                              value: item1,
                              child: Text(item1),
                            ),
                          )
                          .toList(),
                      borderRadius: BorderRadius.circular(16.r),
                      onChanged: (value) {
                        cubit.role = value.toString();
                        setState(() {
                          if (value == "DOCTOR") {
                            specialityCubit.getSpecialityData();
                          }
                        });
                      },
                      decoration: InputDecoration(
                        hintText: AppString.role,
                        hintStyle: TextStyle(
                          color: AppColors.normalGray60,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor: AppColors.normalGray20,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 17.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.sp),
                        ),
                      ),
                    ),
                    GetSpecialityData.getSpecialityModel == null
                        ? const CircularProgressWidget()
                        : cubit.role == 'DOCTOR' &&
                                GetSpecialityData.getSpecialityModel != null &&
                                GetSpecialityData.getSpecialityModel!.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.only(top: 16.h),
                                child:
                                    DropdownButtonFormField<GetSpecialityModel>(
                                  value:
                                      GetSpecialityData.getSpecialityModel![0],
                                  items: GetSpecialityData.getSpecialityModel!
                                      .map(
                                        (GetSpecialityModel item) =>
                                            DropdownMenuItem(
                                          value: item,
                                          child: Text(item.name),
                                        ),
                                      )
                                      .toList(),
                                  borderRadius: BorderRadius.circular(16.r),
                                  onChanged: (value) {
                                    cubit.specialityId = value!.id;
                                  },
                                  decoration: InputDecoration(
                                    hintText: AppString.role,
                                    hintStyle: TextStyle(
                                      color: AppColors.normalGray60,
                                      fontSize: 14.sp,
                                    ),
                                    filled: true,
                                    fillColor: AppColors.normalGray20,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 17.h),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(16.sp),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: TextFormWidget(
                        controller: cubit.passwordController,
                        text: AppString.password,
                        validation: Validator.passwordValidator,
                        isLastInput: true,
                        isPassword: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32.h),
                      child: ButtonWidget(
                        btnController: cubit.btnController,
                        text: AppString.createAccount,
                        function: () {
                          cubit.signUp();
                          CacheHelper.saveEmail(cubit.emailController.text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
