part of 'check_otp_cubit.dart';

@immutable
abstract class CheckOtpStates {}

class CheckOtpInitialState extends CheckOtpStates {}
class CheckOtpLoadingState extends CheckOtpStates {}
class CheckOtpFailedState extends CheckOtpStates {
  final String message;

  CheckOtpFailedState(this.message);

}
class CheckOtpSuccessState extends CheckOtpStates {
  final String message;

  CheckOtpSuccessState(this.message);
}

