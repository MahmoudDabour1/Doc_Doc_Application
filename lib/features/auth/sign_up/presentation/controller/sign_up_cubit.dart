import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/features/auth/sign_up/data/data_sources/sign_up_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../../core/errors/failure.dart';
import '../../domain/use_cases/sign_up_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit(
    this.signUpUseCase,
  ) : super(SignUpInitialState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static SignUpCubit get(context) => BlocProvider.of(context);
  RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  bool isLoading = false;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  late String role = 'USER';
  late int specialityId = 1;

  void signUp() async {
    if (formKey.currentState!.validate()) {
      emit(SignUpLoadingState());
      Either<Failure, SignUpData> signUpData = await signUpUseCase(
        SignUpParameters(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          role: role.toString(),
          phone: phoneController.text,
          password: passwordController.text,
          specialityId: specialityId,
        ),
      );
      if (SignUpData.error) {
        emit(SignUpFailedState(SignUpData.message));
        btnController.stop();
      } else {
        emit(SignUpSuccessState(SignUpData.message));
        btnController.success();
      }
    } else {
      btnController.stop();
    }
  }
}
