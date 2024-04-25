import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/features/auth/check_otp/data/data_sources/check_otp_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/cache_Helper.dart';
import '../../../../../core/utils/helper_method.dart';
import '../../domain/use_cases/check_otp_use_case.dart';

part 'check_otp_state.dart';

class CheckOtpCubit extends Cubit<CheckOtpStates> {
  final CheckOtpUseCase checkOtpUseCase;

  CheckOtpCubit(this.checkOtpUseCase) : super(CheckOtpInitialState());

  static CheckOtpCubit get(context) => BlocProvider.of(context);
  final emailController = TextEditingController();
  String otpValue = '';
  RoundedLoadingButtonController btnController =
  RoundedLoadingButtonController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void checkOtp() async {
    if (otpValue.length != 6) {
      showToast(msg: "Enter Otp Number");
      btnController.stop();
    } else {
      emit(CheckOtpLoadingState());
      Either<Failure, CheckOtpData> checkOtpData = await checkOtpUseCase(
        CheckOtpParameters(
          email: CacheHelper.getEmail(),
          otpValue: otpValue.toString(),
        ),
      );
      if (CheckOtpData.error) {
        emit(CheckOtpFailedState(CheckOtpData.message));
        btnController.stop();
      } else {
        emit(CheckOtpSuccessState(CheckOtpData.message));
        btnController.success();
      }
    }
  }
}
