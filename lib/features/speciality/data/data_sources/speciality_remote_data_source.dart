import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doc_doc_application/core/networks/api_constance.dart';
import 'package:doc_doc_application/core/networks/dio_helper.dart';
import 'package:doc_doc_application/features/speciality/data/models/get_speciality_model.dart';

import 'get_speciality_data.dart';

abstract class BaseSpecialityRemoteDataSource {
  Future<GetSpecialityData> getSpecialityData();
}

class SpecialityRemoteDataSource extends BaseSpecialityRemoteDataSource {
  @override
  Future<GetSpecialityData> getSpecialityData() async {
    final dio = DioHelper();
    final response = await dio.getData(url: ApiConstance.getSpecialityUrl);
    if (response.statusCode == 200) {
      GetSpecialityData.error = false;

      GetSpecialityData.getSpecialityModel = (response.data as List)
          .map((e) => GetSpecialityModel.fromJson(e))
          .toList();
    } else if (response.statusCode == 400 || response.statusCode == 500) {
      GetSpecialityData.error = true;
      GetSpecialityData.message = response.data["id"];
    } else {
      GetSpecialityData.message = response.data["message"];
      GetSpecialityData.error = true;
    }
    return GetSpecialityData();
  }
}
