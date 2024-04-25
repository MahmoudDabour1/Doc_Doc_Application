import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:doc_doc_application/core/utils/app_string.dart';
import 'package:doc_doc_application/core/utils/validator.dart';
import 'package:doc_doc_application/core/widgets/bottom_bar_screen.dart';
import 'package:doc_doc_application/core/widgets/button_widget.dart';
import 'package:doc_doc_application/features/auth/Otp/presentation/screens/view.dart';
import 'package:doc_doc_application/features/auth/login/data/data_sources/login_data.dart';
import 'package:doc_doc_application/features/auth/refresh_otp/presentation/controller/refresh_otp_cubit.dart';
import 'package:doc_doc_application/features/auth/sign_up/presentation/screens/view.dart';
import 'package:doc_doc_application/features/speciality/presentation/controller/get_speciality_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/helper_method.dart';
import '../../../../../core/widgets/above_text_widget.dart';
import '../../../../../core/widgets/bottom_login_widget.dart';
import '../../../../../core/widgets/text_button_widget.dart';
import '../../../../../core/widgets/text_form_widget.dart';
import '../../../refresh_otp/presentation/screens/view.dart';
import '../controller/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRemember = false;
  RoundedLoadingButtonController btnController =
  RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {

    var refreshCubit = RefreshOtpCubit.get(context);
    var getSpecialityCubit = GetSpecialityCubit.get(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(sl()),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginFailedState) {
              // btnController.stop();
              showToast(msg: state.message, color: Colors.red);
              if (LoginData.isDisable) {
                refreshCubit.refreshOtp();
                navigatorTo(
                  context: context,
                  page: const OtpScreen(),
                  withHistory: false,
                );
              }
            }
            if (state is LoginSuccessState) {
              // btnController.success();
              showToast(msg: state.message);
              navigatorTo(
                context: context,
                page: BottomBarScreen(),
                withHistory: false,
              );
            }
          },
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AboveTextWidget(
                        titleText: AppString.welcomeBack,
                        subTitleText: AppString.loginText,
                      ),
                      TextFormWidget(
                        controller: cubit.emailController,
                        text: AppString.email,
                        validation: Validator.emailValidator,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextFormWidget(
                        controller: cubit.passwordController,
                        text: AppString.password,
                        validation: Validator.passwordValidator,
                        isLastInput: true,
                        isPassword: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.h, bottom: 41.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: isRemember,
                                    onChanged: (value) {
                                      setState(() {
                                        isRemember = !isRemember;
                                      });
                                    }),
                                Text(
                                  AppString.remember,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.normalGray60),
                                ),
                              ],
                            ),
                            TextButtonWidget(
                              text: AppString.forgetPassword,
                              function: () {
                                navigatorTo(
                                    context: context, page: const RefreshOtpScreen());
                              },
                            ),
                          ],
                        ),
                      ),
                      ButtonWidget(
                          text: AppString.login,
                          btnController:cubit.btnController,
                          function: () {
                            cubit.login();
                          }),
                      BottomLoginWidget(
                        sign: () {
                          getSpecialityCubit.isDone
                              ? navigatorTo(
                                  context: context,
                                  page: const SignUpScreen(),
                                )
                              : showToast(msg: "Try Again", color: Colors.red);
                        },
                        text: AppString.donHaveAccount,
                        buttonText: AppString.signUp,
                      ),
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
