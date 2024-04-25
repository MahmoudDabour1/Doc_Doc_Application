part of 'refresh_otp_cubit.dart';

abstract class RefreshOtpStates {}

class RefreshOtpInitialState extends RefreshOtpStates {}
class RefreshOtpLoadingState extends RefreshOtpStates {}
class RefreshOtpFailedState extends RefreshOtpStates {
  final String msg;

  RefreshOtpFailedState(this.msg);
}
class RefreshOtpSuccessState extends RefreshOtpStates {

  final String msg;

  RefreshOtpSuccessState(this.msg);
}
