import 'package:doc_doc_application/core/utils/cache_Helper.dart';
import 'package:doc_doc_application/core/utils/helper_method.dart';
import 'package:doc_doc_application/core/utils/validator.dart';
import 'package:doc_doc_application/core/widgets/above_text_widget.dart';
import 'package:doc_doc_application/core/widgets/button_widget.dart';
import 'package:doc_doc_application/core/widgets/text_form_widget.dart';
import 'package:doc_doc_application/features/auth/check_otp/presentation/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_string.dart';
import '../controller/refresh_otp_cubit.dart';

class RefreshOtpScreen extends StatelessWidget {
  const RefreshOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RefreshOtpCubit, RefreshOtpStates>(
        listener: (context, state) {
          if (state is RefreshOtpFailedState) {
            showToast(msg: state.msg, color: Colors.red);
          }
          if (state is RefreshOtpSuccessState) {
            showToast(msg: state.msg);
            navigatorTo(
                context: context,
                page: const CheckOtpScreen(),
                withHistory: false);
          }
        },
        builder: (context, state) {
          var cubit = RefreshOtpCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AboveTextWidget(
                      titleText: AppString.forgetPassword1,
                      subTitleText: AppString.atOurApp,
                    ),
                    TextFormWidget(
                      controller: cubit.emailController,
                      text: AppString.emailOrPhone,
                      isLastInput: true,
                      validation: Validator.emailValidator,
                    ),
                    SizedBox(
                      height: 420.h,
                    ),
                    ButtonWidget(
                      btnController: cubit.btnController,
                      text: AppString.resetPassword,
                      function: () {
                        cubit.refreshOtp();
                        CacheHelper.saveEmail(
                          cubit.emailController.text,
                        );
                      },
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
