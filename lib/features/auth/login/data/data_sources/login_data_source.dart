import 'dart:io';
import 'package:doc_doc_application/core/networks/api_constance.dart';
import 'package:doc_doc_application/core/networks/dio_helper.dart';
import 'package:doc_doc_application/features/auth/login/domain/use_cases/login_use_case.dart';
import 'package:dio/dio.dart';
import '../../../../../core/utils/cache_Helper.dart';
import 'login_data.dart';
import '../models/login_model.dart';

abstract class BaseLoginRemoteDataSource {
  Future<LoginData> login(LoginParameters parameters);
}

class LoginRemoteDataSource implements BaseLoginRemoteDataSource {
  @override
  Future<LoginData> login(LoginParameters parameters) async {
    try {
      final dio = DioHelper();
      final response = await dio.postData(url: ApiConstance.loginUrl, data: {
        'email': parameters.email,
        'password': parameters.password,
      });
      if (response.statusCode == 200) {
        LoginData.error = false;
        LoginData.message = response.data["message"];
        CacheHelper.saveToken(response.data["token"]);
        print(CacheHelper.getToken());
        CacheHelper.saveIfNotFirstTime();
        LoginData.loginModel = LoginModel.fromJson(response.data);
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        if (response.data["message"] == "User is disabled") {
          LoginData.isDisable = true;
          LoginData.error = true;
          LoginData.message = response.data["message"];
        } else {
          LoginData.error = true;
          LoginData.message = response.data["message"];
        }
      }
    } on DioError {
      LoginData.error = true;
      LoginData.message = "Server Failure Please Try Again";
    }
    return LoginData();
  }
}
