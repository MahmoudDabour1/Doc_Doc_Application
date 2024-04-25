import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doc_doc_application/core/networks/api_constance.dart';
import 'package:doc_doc_application/core/networks/dio_helper.dart';
import 'package:doc_doc_application/core/utils/cache_Helper.dart';
import 'package:doc_doc_application/features/auth/forget_password/data/models/forget_password_model.dart';
import 'package:doc_doc_application/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';

import 'forget_password_data.dart';

abstract class BaseForgetPasswordRemoteDataSource {
  Future<ForgetPasswordData> submitPassword(
      ForgetPasswordParameters parameters);
}

class ForgetPasswordRemoteDataSource
    extends BaseForgetPasswordRemoteDataSource {
  @override
  Future<ForgetPasswordData> submitPassword(
      ForgetPasswordParameters parameters) async {
    try {
      final dio = DioHelper();
      final response = await dio.putData(
        url:ApiConstance.forgetPasswordUrl,
        data: {
          "email": CacheHelper.getEmail(),
          "newPassword": parameters.password,
          "confirmNewPassword": parameters.confirmPassword,
        },
      );
      if (response.statusCode == 200) {
        ForgetPasswordData.error = false;
        ForgetPasswordData.message = response.data["message"];
        ForgetPasswordData.forgetPasswordModel =
            ForgetPasswordModel.fromJson(response.data);
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        ForgetPasswordData.error = true;
        ForgetPasswordData.message = response.data["message"];
      } else {
        ForgetPasswordData.error = true;
        ForgetPasswordData.message = response.data["message"];
      }
    } on DioError {
      ForgetPasswordData.error = true;
      ForgetPasswordData.message = "Server Failure Please Try Again";
    }
    return ForgetPasswordData();
  }
}
