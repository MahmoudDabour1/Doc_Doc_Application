import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doc_doc_application/core/networks/dio_helper.dart';
import 'package:doc_doc_application/core/utils/cache_Helper.dart';
import 'package:doc_doc_application/features/auth/Otp/data/models/otp_model.dart';
import 'package:doc_doc_application/features/auth/Otp/domain/use_cases/otp_use_case.dart';
import 'otp_data.dart';

abstract class BaseOtpRemoteDataSource {
  Future<OtpData> sendOtp(OtpParameters parameters);
}

class OtpRemoteDataSource extends BaseOtpRemoteDataSource {
  @override
  Future<OtpData> sendOtp(OtpParameters parameters) async {
    try {
      final dio = DioHelper();
      final response = await dio.postData(
        url:
            "https://docdoc.onrender.com/api/auth/activateAccount?email=${CacheHelper.getEmail()}&otp=${parameters.otpValue}",
        data: null,
      );
      if (response.statusCode == 200) {
        OtpData.error = false;
        OtpData.message = response.data["message"];
        OtpData.otpModel = OtpModel.fromJson(response.data);
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        OtpData.error = true;
        OtpData.message = response.data["message"];
      } else {
        OtpData.error = true;
        OtpData.message = response.data["message"];
      }
    } on DioError {
      OtpData.error = true;
      OtpData.message = "Server Failure Please Try Again";
    }
    return OtpData();
  }
}
