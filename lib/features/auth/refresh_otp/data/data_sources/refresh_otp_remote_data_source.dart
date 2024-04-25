import 'dart:io';
import 'package:dio/dio.dart';
import 'package:doc_doc_application/core/networks/dio_helper.dart';
import 'package:doc_doc_application/core/utils/cache_Helper.dart';
import '../../domain/use_cases/refresh_otp_use_case.dart';
import '../models/refresh_otp_model.dart';
import 'refrest_otp_data.dart';

abstract class BaseRefreshOtpRemoteDataSource {
  Future<RefreshOtpData> refreshOtp(RefreshOtpParameters parameters);
}

class RefreshOtpRemoteDataSource extends BaseRefreshOtpRemoteDataSource {
  @override
  Future<RefreshOtpData> refreshOtp(RefreshOtpParameters parameters) async {
    try {
      final dio = DioHelper();

      final response = await dio.putData(
        url:
            "https://docdoc.onrender.com/api/auth/refreshOtp?email=${CacheHelper.getEmail()}",
        data: {
          'email': CacheHelper.getEmail(),
        },
      );
      if (response.statusCode == 200) {
        RefreshOtpData.error = false;
        RefreshOtpData.message = response.data["message"];
        RefreshOtpData.refreshOtpModel =
            RefreshOtpModel.fromJson(response.data);
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        RefreshOtpData.error = true;
        RefreshOtpData.message = response.data["message"];
      } else {
        RefreshOtpData.error = true;
        RefreshOtpData.message = response.data["message"];
      }
    } on DioError {
      RefreshOtpData.error = true;
      RefreshOtpData.message = "Server Failure Please Try Again";
    }
    return RefreshOtpData();
  }
}
