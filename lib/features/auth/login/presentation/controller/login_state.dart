part of 'login_cubit.dart';

@immutable
abstract class LoginStates {}

class LoginInitialState extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginFailedState extends LoginStates {
  final String message;

  LoginFailedState(this.message);
}
class LoginSuccessState extends LoginStates {
  final String message;

  LoginSuccessState(this.message);
}
