import 'package:doc_doc_application/features/auth/check_otp/domain/entities/check_otp_entity.dart';

class CheckOtpModel extends CheckOtpEntity{
  const CheckOtpModel({required super.message});

  factory CheckOtpModel.fromJson(Map<String, dynamic> json) {
    return CheckOtpModel(
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
    };
  }
}