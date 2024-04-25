part of 'profile_cubit.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileFailedState extends ProfileStates {
  final String msg;

  ProfileFailedState(this.msg);
}

class ProfileSuccessState extends ProfileStates {
final ProfileModel profileModel;

ProfileSuccessState(this.profileModel);

}
