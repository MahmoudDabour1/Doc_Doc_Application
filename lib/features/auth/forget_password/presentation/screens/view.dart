import 'package:doc_doc_application/core/utils/helper_method.dart';
import 'package:doc_doc_application/core/utils/validator.dart';
import 'package:doc_doc_application/core/widgets/button_widget.dart';
import 'package:doc_doc_application/core/widgets/text_form_widget.dart';
import 'package:doc_doc_application/features/auth/forget_password/presentation/controller/forget_password_cubit.dart';
import 'package:doc_doc_application/features/auth/login/presentation/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/widgets/above_text_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(sl()),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
            listener: (context, state) {
              if (state is ForgetPasswordFailedState) {
                showToast(msg: state.message, color: Colors.red);
              }
              if (state is ForgetPasswordSuccessState) {
                showToast(msg: state.message);
                navigatorTo(context: context, page: const LoginScreen());
              }
            },
            builder: (context, state) {
              var cubit = ForgetPasswordCubit.get(context);
              return SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      const AboveTextWidget(
                        titleText: AppString.newPassword,
                        subTitleText: AppString.strongPassword,
                      ),
                      TextFormWidget(
                        controller: cubit.passwordController,
                        text: AppString.password,
                        validation: Validator.passwordValidator,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextFormWidget(
                        controller: cubit.confirmPasswordController,
                        text: AppString.confirmPassword,
                        isLastInput: true,
                        validation: Validator.passwordValidator,
                      ),
                      SizedBox(
                        height: 371.h,
                      ),
                       Center(
                              child: ButtonWidget(
                                btnController: cubit.btnController,
                                text: AppString.submitPassword,
                                function: () {
                                  cubit.submitPassword();
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
