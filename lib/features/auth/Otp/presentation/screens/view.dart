import 'package:code_input/code_input.dart';
import 'package:doc_doc_application/core/utils/app_string.dart';
import 'package:doc_doc_application/core/utils/helper_method.dart';
import 'package:doc_doc_application/core/widgets/above_text_widget.dart';
import 'package:doc_doc_application/core/widgets/button_widget.dart';
import 'package:doc_doc_application/features/auth/Otp/presentation/controller/otp_cubit.dart';
import 'package:doc_doc_application/features/auth/refresh_otp/presentation/controller/refresh_otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_button/timer_button.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../login/presentation/screens/view.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var refreshOtpCubit = RefreshOtpCubit.get(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => OtpCubit(sl()),
        child: BlocConsumer<OtpCubit, OtpStates>(
          listener: (context, state) {
            if (state is OtpFailedState) {
              showToast(msg: state.message, color: Colors.red);
            }
            if (state is OtpSuccessState) {
              showToast(msg: state.message);
              navigatorTo(
                context: context,
                page: const LoginScreen(),
              );
            }
          },
          builder: (context, state) {
            var cubit = OtpCubit.get(context);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AboveTextWidget(
                        titleText: AppString.otp,
                        subTitleText: AppString.addAPin,
                      ),
                      Center(
                        child: CodeInput(
                          length: 6,
                          keyboardType: TextInputType.number,
                          builder: CodeInputBuilders.darkRectangle(
                              emptySize: Size(35.w, 50.h),
                              borderRadius: BorderRadius.circular(10.r)),
                          spacing: 5.w,
                          onDone: (value) {
                            cubit.otpValue = value;
                          },
                          onFilled: (value) {
                            cubit.otpValue = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 371.h,
                      ),
                      Center(
                        child: ButtonWidget(
                            btnController: cubit.btnController,
                            text: AppString.submit,
                            function: () {
                              cubit.sendOtp(
                                cubit.emailController,
                              );
                            }),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppString.donHaveOtp,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          TimerButton(
                            label: AppString.sendAgain,
                            timeOutInSeconds: 60,
                            color: AppColors.normalBlue100,
                            disabledColor: AppColors.normalGray30,
                            resetTimerOnPressed: true,
                            timeUpFlag: true,
                            activeTextStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            buttonType: ButtonType.textButton,
                            onPressed: () {
                              refreshOtpCubit.refreshOtp();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
