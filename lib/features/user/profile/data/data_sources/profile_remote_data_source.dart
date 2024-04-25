import 'dart:io';
import 'package:dio/dio.dart';
import 'package:doc_doc_application/core/networks/api_constance.dart';
import 'package:doc_doc_application/core/networks/dio_helper.dart';
import 'package:doc_doc_application/core/utils/cache_Helper.dart';
import 'package:doc_doc_application/features/user/profile/data/data_sources/profile_data.dart';
import '../../domain/use_cases/profile_use_case.dart';
import '../models/profile_model.dart';

abstract class BaseProfileRemoteDataSource {
  Future<ProfileData> getProfileData(ProfileParameters parameters);
}

class ProfileRemoteDataSource extends BaseProfileRemoteDataSource {
  @override
  Future<ProfileData> getProfileData(ProfileParameters parameters) async {
    try {
      final dio = DioHelper();
      final response = await dio.getData(
        url: ApiConstance.getProfileDataUrl,
      );
      if (response.statusCode == 200) {
        ProfileData.error = false;
        ProfileData.profileModel = ProfileModel.fromJson(response.data);
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        ProfileData.error = true;
        ProfileData.message = response.data["message"];
      } else {
        ProfileData.error = true;
        ProfileData.message = response.data["message"];
      }
    } on DioError {
      ProfileData.error = true;
      ProfileData.message = "Server Failure Please Try Again";
    }
    return ProfileData();
  }
}
