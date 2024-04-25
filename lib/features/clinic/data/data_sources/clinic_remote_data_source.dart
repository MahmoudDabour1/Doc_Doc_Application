import 'package:dio/dio.dart';
import 'package:doc_doc_application/core/networks/api_constance.dart';
import 'package:doc_doc_application/core/networks/dio_helper.dart';
import 'package:doc_doc_application/features/clinic/data/data_sources/save_clinic_data.dart';
import 'package:doc_doc_application/features/clinic/data/models/find_nearby_model.dart';
import 'package:doc_doc_application/features/clinic/data/models/get_doctor_clinic_model.dart';
import 'package:doc_doc_application/features/clinic/data/models/save_clinic_model.dart';
import 'package:doc_doc_application/features/clinic/domain/use_cases/nearby_use_case.dart';
import 'package:doc_doc_application/features/clinic/domain/use_cases/save_clinic_use_case.dart';

import '../../../../core/constants/constants.dart';
import '../../../speciality/data/data_sources/get_speciality_data.dart';
import '../../domain/use_cases/get_doctor_clinic_use_case.dart';
import 'get_doctor_clinics_data.dart';
import 'get_nearby_data.dart';

abstract class BaseClinicRemoteDataSource {
  Future<GetNearbyData> getNearby(FindNearbyParameters parameters);

  Future<SaveClinicData> saveClinic(SaveClinicModel saveClinicModel);

  Future<GetDoctorClinicsData> getDoctorClinics(
      GetDoctorClinicsParameters parameters);
}

class ClinicRemoteDataSource extends BaseClinicRemoteDataSource {
  final dio = DioHelper();

  @override
  Future<GetNearbyData> getNearby(FindNearbyParameters parameters) async {
    final response = await dio.getData(
      url:
      "https://docdoc.onrender.com/api/clinic/findNearby?latitude=${parameters
          .latitude}&longitude=${parameters.longitude}&page=0",
    );
    if (response.statusCode == 200) {
      GetNearbyData.error = false;
      GetNearbyData.findNearbyModel = (response.data as List)
          .map((e) => FindNearbyModel.fromJson(e))
          .toList();
    }
    else if (response.statusCode == 400 || response.statusCode == 500) {
      GetNearbyData.error = true;
      GetNearbyData.message = response.data["message"];
    } else {
      GetNearbyData.error = true;
      GetNearbyData.message = response.data["message"];
    }
    return GetNearbyData();
  }

  @override
  Future<SaveClinicData> saveClinic(SaveClinicModel saveClinicModel) async {
    try {
      final response = await dio.postData(
        url: ApiConstance.saveClinicUrl,
        data: saveClinicModel.toJson(),
      );
      print(saveClinicModel.toJson());
      if (response.statusCode == 200) {
        print(response.data["message"]);
        SaveClinicData.error = false;
        SaveClinicData.message = response.data['message'];
        // final List<SaveClinicModel> saveClinicData = (response.data as List)
        //     .map((e) => SaveClinicModel.fromJson(e))
        //     .toList();
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        print(response.data["message"]);
        SaveClinicData.error = true;
        SaveClinicData.message = response.data['message'];
      } else {
        print(response.data["message"]);
        SaveClinicData.error = true;
        SaveClinicData.message = response.data['message'];
      }
    } on DioError catch (e) {
      print(e.message);
      SaveClinicData.error = true;
      SaveClinicData.message = e.toString();
    }
    return SaveClinicData();
  }

  @override
  Future<GetDoctorClinicsData> getDoctorClinics(
      GetDoctorClinicsParameters parameters) async {
      final response = await dio.getData(
          url: "https://docdoc.onrender.com/api/clinic/doctorClinics?page=0&id=3",
          data: {
            'page': parameters.page,
            'id': parameters.id,
          });
      if (response.statusCode == 200) {
        GetDoctorClinicsData.error = false;
        GetDoctorClinicsData.getDoctorClinicsModel = (response.data as List)
            .map((e) => GetDoctorClinicsModel.fromJson(e))
            .toList();
      }
      else if (response.statusCode == 400 || response.statusCode == 500) {
        GetDoctorClinicsData.error = true;
        GetDoctorClinicsData.message = response.data["message"];
      } else {
        GetDoctorClinicsData.error = true;
        GetDoctorClinicsData.message = response.data["message"];
      }
      return GetDoctorClinicsData();
  }
}
