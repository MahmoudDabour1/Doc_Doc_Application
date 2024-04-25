
import '../../domain/entities/refresh_otp_entity.dart';

class RefreshOtpModel extends RefreshOtoEntity {
  const RefreshOtpModel({
    required super.message,
  });

  factory RefreshOtpModel.fromJson(Map<String, dynamic> json) {
    return RefreshOtpModel(
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
