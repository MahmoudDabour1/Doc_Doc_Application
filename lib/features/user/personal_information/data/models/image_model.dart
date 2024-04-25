
import '../../domain/entities/image_entiry.dart';

class ImageModel extends ImageEntity{
  const ImageModel({required super.message});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
    };
  }
}