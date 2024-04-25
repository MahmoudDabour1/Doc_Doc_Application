import 'dart:io';
import 'package:dio/dio.dart';
import 'package:doc_doc_application/core/networks/api_constance.dart';
import 'package:doc_doc_application/core/networks/dio_helper.dart';
import 'package:doc_doc_application/features/auth/sign_up/data/data_sources/sign_up_data.dart';
import 'package:doc_doc_application/features/auth/sign_up/data/models/sign_up_model.dart';
import 'package:doc_doc_application/features/auth/sign_up/domain/use_cases/sign_up_use_case.dart';

abstract class BaseSignUpRemoteDataSource {
  Future<SignUpData> signUp(SignUpParameters parameters);
}

class SignUpRemoteDataSource extends BaseSignUpRemoteDataSource {
  @override
  Future<SignUpData> signUp(SignUpParameters parameters) async {
    try {
      final dio = DioHelper();
      Map<String, dynamic> data = {
        'firstName': parameters.firstName,
        'lastName': parameters.lastName,
        'email': parameters.email,
        'password': parameters.password,
        'phone': parameters.phone,
        'role': parameters.role,
        'specialityId': parameters.specialityId,
      };

      print(data);
      final response = await dio.postData(
        url:ApiConstance.signUpUrl,
        data: data,
      );
      if (response.statusCode == 201) {
        SignUpData.error = false;
        SignUpData.message = response.data["message"];
        SignUpData.signUpModel = SignUpModel.fromJson(response.data);
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        SignUpData.error = true;
        SignUpData.message = response.data["message"];
      }  else {
        SignUpData.error = true;
        SignUpData.message = response.data["message"];
      }
    } on DioError {
      SignUpData.error = true;
      SignUpData.message = "Server Failure Please Try Again";
    }
    return SignUpData();
  }
}
