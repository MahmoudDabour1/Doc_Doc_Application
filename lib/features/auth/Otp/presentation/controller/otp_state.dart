part of 'otp_cubit.dart';

@immutable
abstract class OtpStates {}

class OtpInitialState extends OtpStates {}
class OtpLoadingState extends OtpStates {}
class OtpFailedState extends OtpStates {
  final String message;

  OtpFailedState(this.message);

}
class OtpSuccessState extends OtpStates {
  final String message;

  OtpSuccessState(this.message);
}
