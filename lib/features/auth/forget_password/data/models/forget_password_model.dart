import 'package:doc_doc_application/features/auth/forget_password/domain/entities/forget_password_entity.dart';

class ForgetPasswordModel extends ForgetPasswordEntity{
  const ForgetPasswordModel({required super.message});

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message':message,
    };
  }
}