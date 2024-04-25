
import '../../domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity{
  const ProfileModel({required super.firstName, required super.lastName, required super.email, required super.phone, required super.image, required super.role});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],
      image: json["image"]??'https://static-00.iconduck.com/assets.00/person-icon-476x512-hr6biidg.png',
      role: json["role"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName" : firstName,
      "lastName" : lastName,
      "email" : email,
      "phone" : phone,
      "image" : image,
      "role" : role,
    };
  }
}