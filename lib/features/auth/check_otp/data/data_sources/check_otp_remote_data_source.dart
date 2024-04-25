import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doc_doc_application/core/networks/dio_helper.dart';
import 'package:doc_doc_application/features/auth/check_otp/data/models/check_otp_model.dart';
import 'package:doc_doc_application/features/auth/check_otp/domain/use_cases/check_otp_use_case.dart';

import '../../../../../core/utils/cache_Helper.dart';
import 'check_otp_data.dart';

abstract class BaseCheckOtpRemoteDataSource {
  Future<CheckOtpData> checkOtp(CheckOtpParameters parameters);
}

class CheckOtpRemoteDataSource extends BaseCheckOtpRemoteDataSource {
  @override
  Future<CheckOtpData> checkOtp(CheckOtpParameters parameters) async {
    try {
      final dio = DioHelper();
      final response = await dio.getData(
        url:
            "https://docdoc.onrender.com/api/auth/checkOtp?email=${CacheHelper.getEmail()}&otp=${parameters.otpValue}",
      );
      if (response.statusCode == 200) {
        CheckOtpData.error = false;
        CheckOtpData.message = response.data["message"];
        CheckOtpData.checkOtpModel = CheckOtpModel.fromJson(response.data);
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        CheckOtpData.error = true;
        CheckOtpData.message = response.data["message"];
      } else {
        CheckOtpData.error = true;
        CheckOtpData.message = response.data["message"];
      }
    } on DioError {
      CheckOtpData.error = true;
      CheckOtpData.message = "Server Failure Please Try Again";
    }
    return CheckOtpData();
  }
}
