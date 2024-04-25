import 'package:doc_doc_application/features/speciality/domain/entities/get_speciality_entity.dart';

class GetSpecialityModel extends GetSpecialityEntity {
  const GetSpecialityModel(
      {required super.id, required super.name, required super.image});

  factory GetSpecialityModel.fromJson(Map<String, dynamic> json) {
    return GetSpecialityModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
    };
  }
}
