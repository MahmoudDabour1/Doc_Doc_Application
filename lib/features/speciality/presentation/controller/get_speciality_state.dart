part of 'get_speciality_cubit.dart';

abstract class GetSpecialityStates {}

class GetSpecialityInitialState extends GetSpecialityStates {}
class GetSpecialityLoadingState extends GetSpecialityStates {}
class GetSpecialityFailedState extends GetSpecialityStates {
  final String error;
  GetSpecialityFailedState({required this.error});

}
class GetSpecialitySuccessState extends GetSpecialityStates {
  final String msg;
  GetSpecialitySuccessState({required this.msg});
}

