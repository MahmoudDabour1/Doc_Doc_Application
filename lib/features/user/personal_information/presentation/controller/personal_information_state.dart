part of 'personal_information_cubit.dart';

@immutable
abstract class PersonalInformationStates {}

class ChangeImageInitialState extends PersonalInformationStates {}

class ChangeImageLoadingState extends PersonalInformationStates {}

class ChangeImageLocalState extends PersonalInformationStates {}

class ChangeImageFailedState extends PersonalInformationStates {
  final String msg;

  ChangeImageFailedState(this.msg);
}

class ChangeImageSuccessState extends PersonalInformationStates {
  final String msg;

  ChangeImageSuccessState(this.msg);
}

class UpdateDataLoadingState extends PersonalInformationStates {}

class UpdateDataFailedState extends PersonalInformationStates {
  final String msg;

  UpdateDataFailedState(this.msg);
}

class UpdateDataSuccessState extends PersonalInformationStates {
  final String msg;

  UpdateDataSuccessState(this.msg);
}

class UpdateProfileSuccessState extends PersonalInformationStates {
  final bool updateImage;

  final bool updateData;
  final String msg;

  UpdateProfileSuccessState(this.msg, this.updateImage, this.updateData);
}

class UploadProfileDateLoadingState extends PersonalInformationStates {}

class UploadProfileDateFailedState extends PersonalInformationStates {
  final String msg;

  UploadProfileDateFailedState(this.msg);
}

class UploadProfileDateSuccessState extends PersonalInformationStates {
  final String msg;

  UploadProfileDateSuccessState(this.msg);
}
