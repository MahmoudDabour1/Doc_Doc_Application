import 'package:doc_doc_application/features/speciality/domain/entities/get_speciality_entity.dart';
import 'package:doc_doc_application/features/user/profile/domain/entities/profile_entity.dart';
import 'package:equatable/equatable.dart';

class DoctorDetails extends Equatable {
  final int id;
  final int rate;
  final int numOfReviews;
  final dynamic aboutMe;
  final GetSpecialityEntity speciality;
  final ProfileEntity user;

  const DoctorDetails({
    required this.id,
    required this.rate,
    required this.numOfReviews,
    required this.aboutMe,
    required this.speciality,
    required this.user,
  });

  @override
  List<Object> get props =>
      [id, rate, numOfReviews, aboutMe, speciality, user,];
}


