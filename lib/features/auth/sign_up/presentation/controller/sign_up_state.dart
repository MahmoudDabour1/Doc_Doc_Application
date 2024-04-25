part of 'sign_up_cubit.dart';

abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}
class SignUpLoadingState extends SignUpStates {}
class SignUpFailedState extends SignUpStates{
  final String message;

  SignUpFailedState(this.message);
}
class SignUpSuccessState extends SignUpStates {
  final String message;

  SignUpSuccessState(this.message);
}

