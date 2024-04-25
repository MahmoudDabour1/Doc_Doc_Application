import 'package:doc_doc_application/features/auth/Otp/domain/entities/otp_entity.dart';

class OtpModel extends OtpEntity {
  const OtpModel({required super.message});

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
