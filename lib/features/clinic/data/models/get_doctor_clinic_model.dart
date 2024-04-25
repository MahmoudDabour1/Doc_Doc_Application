import 'package:doc_doc_application/features/clinic/domain/entities/get_doctor_clinic_entity.dart';

class GetDoctorClinicsModel extends GetDoctorClinicEntity {
  const GetDoctorClinicsModel({
    required super.id,
    required super.name,
    required super.image,
    required super.latitude,
    required super.longitude,
  });

  factory GetDoctorClinicsModel.fromJson(Map<String, dynamic> json) {
    return GetDoctorClinicsModel(
      name: json["name"],
      image: json["image"],
      id: json["id"],
      latitude: json["latitude"],
      longitude: json["longitude"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "id": id,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
