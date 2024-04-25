part of 'clinic_cubit.dart';

abstract class ClinicStates {}

class ClinicInitialState extends ClinicStates {}

class ClinicLoadingState extends ClinicStates {}

class ClinicFailedState extends ClinicStates {
  final String error;

  ClinicFailedState({required this.error});
}

class ClinicSuccessState extends ClinicStates {
  final String message;

  ClinicSuccessState({
    required this.message,
  });
}

class FindNearbyInitialState extends ClinicStates {}

class FindNearbyLoadingState extends ClinicStates {}

class GetCurrentLocationSuccessState extends ClinicStates {}

class FindNearbyFailedState extends ClinicStates {
  final String error;

  FindNearbyFailedState({required this.error});
}

class FindNearbySuccessState extends ClinicStates {
  final String error;

  FindNearbySuccessState({required this.error});
}

class GetDoctorClinicsInitialState extends ClinicStates {}

class GetDoctorClinicsLoadingState extends ClinicStates {}

class GetDoctorClinicsSuccessState extends ClinicStates {
  final String error;

  GetDoctorClinicsSuccessState({required this.error});
}

class GetDoctorClinicsFailedState extends ClinicStates {
  final String error;

  GetDoctorClinicsFailedState({required this.error});
}
