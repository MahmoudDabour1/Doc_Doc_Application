import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/auth/login/data/data_sources/login_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../domain/use_cases/login_use_case.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RoundedLoadingButtonController btnController =
  RoundedLoadingButtonController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      Either<Failure, LoginData> loginData = await loginUseCase(LoginParameters(
        email: emailController.text,
        password: passwordController.text,
      ));

      if (LoginData.error) {
        emit(LoginFailedState(LoginData.message));
        btnController.stop();
      } else {
        emit(LoginSuccessState(LoginData.message));
        btnController.success();
      }
    }else{
      btnController.stop();
    }
  }
}
