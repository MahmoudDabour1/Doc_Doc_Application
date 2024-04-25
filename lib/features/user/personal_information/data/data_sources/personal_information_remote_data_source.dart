import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doc_doc_application/core/networks/dio_helper.dart';
import 'package:doc_doc_application/features/user/personal_information/data/data_sources/image_data.dart';
import 'package:doc_doc_application/features/user/personal_information/data/data_sources/update_data.dart';
import 'package:doc_doc_application/features/user/personal_information/data/models/update_data_model.dart';
import 'package:doc_doc_application/features/user/personal_information/domain/use_cases/image_use_case.dart';
import 'package:doc_doc_application/features/user/personal_information/domain/use_cases/update_data_use_case.dart';

import '../../../../../core/networks/api_constance.dart';
import '../../../../../core/utils/cache_Helper.dart';
import '../models/image_model.dart';

abstract class BaseImageRemoteDataSource {
  Future<ImageData> changeImage(ImageParameters parameters);

  Future<UpdateData> updateData(UpdateDataParameters parameters);
}

class ImageRemoteDataSource extends BaseImageRemoteDataSource {
  @override
  Future<ImageData> changeImage(ImageParameters parameters) async {
    try {
      final dio = DioHelper();
      final response = await dio.postData(
        url:ApiConstance.postUserImageUrl,
        data: FormData.fromMap({
          "multipartFile": parameters.imageUrl != null
              ? MultipartFile.fromFileSync(parameters.imageUrl,
                  filename: parameters.imageUrl.split("/").last)
              : null,
        }),
      );
      if (response.statusCode == 200) {
        ImageData.error = false;
        ImageData.message = response.data["message"];
        ImageData.imageModel = ImageModel.fromJson(response.data);
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        print(response.data["message"]);
        ImageData.error = true;
        ImageData.message = response.data["message"];
      } else {
        print(response.data["message"]);
        ImageData.error = true;
        ImageData.message = "Server error :";
      }
    } on DioError catch(e) {
      print(e.toString());
      ImageData.error = true;
      ImageData.message = "Server Error Please Try Again";
    }
    return ImageData();
  }

  @override
  Future<UpdateData> updateData(UpdateDataParameters parameters) async {
    try {
      final dio = DioHelper();
      final response = await dio.putData(
        url:ApiConstance.updateDataUrl,
        data: {
          "firstName": parameters.firstName,
          "lastName": parameters.lastName,
          "phone": parameters.phoneName,
        },
      );
      if (response.statusCode == 200) {
        UpdateData.error = false;
        UpdateData.message = response.data["message"];
        UpdateData.updateDataModel = UpdateDataModel.fromJson(response.data);
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        UpdateData.error = true;
        UpdateData.message = response.data["message"];
      } else {
        UpdateData.error = true;
        UpdateData.message = "Server error :";
      }
    } on DioError {
      UpdateData.error = true;
      UpdateData.message = "Server Error Please Try Again";
    }
    return UpdateData();
  }
}
