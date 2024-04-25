import 'package:equatable/equatable.dart';

class GetDoctorClinicEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final double latitude;
  final double longitude;

  const GetDoctorClinicEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object> get props => [
        id,
        name,
        image,
        latitude,
        longitude,
      ];
}
