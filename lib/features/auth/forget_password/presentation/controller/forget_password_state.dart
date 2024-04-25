part of 'forget_password_cubit.dart';

abstract class ForgetPasswordStates {}

class ForgetPasswordInitialState extends ForgetPasswordStates {}
class ForgetPasswordLoadingState extends ForgetPasswordStates {}
class ForgetPasswordFailedState extends ForgetPasswordStates {
  final String message;

  ForgetPasswordFailedState(this.message);
}
class ForgetPasswordSuccessState extends ForgetPasswordStates {
  final String message;

  ForgetPasswordSuccessState(this.message);
}
