import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/utils/helper_method.dart';
import 'package:doc_doc_application/features/auth/Otp/data/data_sources/otp_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/cache_Helper.dart';
import '../../domain/use_cases/otp_use_case.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpStates> {
  final OtpUseCase otpUseCase;

  OtpCubit(this.otpUseCase) : super(OtpInitialState());

  static OtpCubit get(context) => BlocProvider.of(context);
  final emailController = TextEditingController();
  String otpValue = '';
  RoundedLoadingButtonController btnController =
  RoundedLoadingButtonController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void sendOtp(controller) async {
    if (otpValue.length != 6) {
      showToast(msg: "Enter Otp Number");
      btnController.stop();
    }else{
      emit(OtpLoadingState());
      Either<Failure, OtpData> otpData = await otpUseCase(
        OtpParameters(
          email: CacheHelper.getEmail(),
          otpValue: otpValue.toString(),
        ),
      );
      if (OtpData.error) {
        emit(OtpFailedState(OtpData.message));
        btnController.stop();
      }  else{
        emit(OtpSuccessState(OtpData.message));
        btnController.success();
      }
    }
  }
}
