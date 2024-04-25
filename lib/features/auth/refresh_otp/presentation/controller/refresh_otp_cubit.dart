import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/utils/cache_Helper.dart';
import 'package:doc_doc_application/features/auth/refresh_otp/data/data_sources/refrest_otp_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/use_cases/refresh_otp_use_case.dart';

part 'refresh_otp_state.dart';

class RefreshOtpCubit extends Cubit<RefreshOtpStates> {
  final RefreshOtpUseCase refreshOtoUseCase;

  RefreshOtpCubit(this.refreshOtoUseCase) : super(RefreshOtpInitialState());

  static RefreshOtpCubit get(context) => BlocProvider.of(context);
  final emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RoundedLoadingButtonController btnController =
  RoundedLoadingButtonController();

  void refreshOtp() async {
    if (formKey.currentState!.validate()) {
      emit(RefreshOtpLoadingState());
      Either<Failure, RefreshOtpData> refreshOtpData = await refreshOtoUseCase(
        RefreshOtpParameters(
          email: CacheHelper.getEmail(),
        ),
      );
      if (RefreshOtpData.error) {
        emit(RefreshOtpFailedState(RefreshOtpData.message));
        btnController.stop();
      } else {
        Constants.isForgetPassword = true;
        emit(RefreshOtpSuccessState(RefreshOtpData.message));
        btnController.success();
      }
    }else{
      btnController.stop();
    }
  }
}
