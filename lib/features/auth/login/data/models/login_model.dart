import 'package:doc_doc_application/features/auth/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({required super.token, required super.message});


  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json["token"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "message": message,
    };
  }
}
