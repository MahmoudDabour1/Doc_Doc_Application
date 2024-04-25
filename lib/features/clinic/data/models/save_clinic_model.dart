import 'package:doc_doc_application/features/clinic/domain/entities/save_clinic_entity.dart';


class SaveClinicModel extends SaveClinicEntity {
  const SaveClinicModel({
    required super.name,
    required super.latitude,
    required super.longitude,
    required super.workDays,
  });

  // factory SaveClinicModel.fromJson(Map<String, dynamic> json) {
  //   return SaveClinicModel(
  //     name: json["name"],
  //     longitude: json["longitude"].toDouble(),
  //     latitude: json["latitude"].toDouble(),
  //     workDays: WorkDayModel.
  //   );
  // }

   Map<String, dynamic>toJson() {
    return {
      'name': name,
      'longitude': longitude,
      'latitude': latitude,
      'workDays': workDays.map((workDay) => workDay.toJson()).toList(),
    };
  }
}
