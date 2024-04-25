import 'package:code_input/code_input.dart';
import 'package:doc_doc_application/features/auth/check_otp/presentation/controller/check_otp_cubit.dart';
import 'package:doc_doc_application/features/auth/forget_password/presentation/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_button/timer_button.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/helper_method.dart';
import '../../../../../core/widgets/above_text_widget.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../refresh_otp/presentation/controller/refresh_otp_cubit.dart';

class CheckOtpScreen extends StatelessWidget {
  const CheckOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var refreshOtpCubit = RefreshOtpCubit.get(context);
    return Scaffold(
        body: BlocProvider(
      create: (context) => CheckOtpCubit(sl()),
      child: BlocConsumer<CheckOtpCubit, CheckOtpStates>(
        listener: (context, state) {
          if (state is CheckOtpFailedState) {
            showToast(msg: state.message, color: Colors.red);
          }
          if (state is CheckOtpSuccessState) {
            showToast(msg: state.message);
            navigatorTo(context: context, page: const ForgetPasswordScreen());
          }
        },
        builder: (context, state) {
          var cubit = CheckOtpCubit.get(context);
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
                          debugPrint(cubit.otpValue);
                          FocusScope.of(context).unfocus();
                          cubit.checkOtp();
                        },
                        onFilled: (value) {
                          cubit.otpValue = value;
                          debugPrint('{${cubit.otpValue}}');
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
                                  cubit.checkOtp();
                                }),
                          ),
                    SizedBox(height: 10.h),
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
    ));
  }
}
