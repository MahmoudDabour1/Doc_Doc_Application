import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/features/auth/forget_password/data/data_sources/forget_password_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/cache_Helper.dart';
import '../../domain/use_cases/forget_password_use_case.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  final ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordCubit(this.forgetPasswordUseCase)
      : super(ForgetPasswordInitialState());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RoundedLoadingButtonController btnController =
  RoundedLoadingButtonController();

  void submitPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ForgetPasswordLoadingState());
      Either<Failure, ForgetPasswordData> forgetPasswordData =
          await forgetPasswordUseCase(
        ForgetPasswordParameters(
          email: CacheHelper.getEmail(),
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        ),
      );
      if (ForgetPasswordData.error) {
        emit(ForgetPasswordFailedState(ForgetPasswordData.message));
        btnController.stop();
      } else {
        emit(ForgetPasswordSuccessState(ForgetPasswordData.message));
        btnController.success();
      }
    }else{
      btnController.stop();
    }
  }
}
