import 'package:doc_doc_application/features/clinic/domain/entities/find_nearby_entity.dart';

class FindNearbyModel extends FindNearbyEntity {
  const FindNearbyModel(
      {required super.name,
      required super.image,
      required super.latitude,
      required super.longitude, required super.id
      });

  factory FindNearbyModel.fromJson(Map<String, dynamic> json) {
    return FindNearbyModel(
      id: json["id"],
      name: json["name"],
      image: json["image"]??'',
      latitude: json["latitude"],
      longitude: json["longitude"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "latitude": latitude,
      "longitude": longitude,

    };
  }
}
