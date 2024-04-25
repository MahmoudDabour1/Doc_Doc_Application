import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/features/clinic/domain/entities/save_clinic_entity.dart';
import 'package:doc_doc_application/features/clinic/domain/use_cases/save_clinic_use_case.dart';

import '../../../../core/errors/failure.dart';
import '../../data/data_sources/get_doctor_clinics_data.dart';
import '../../data/data_sources/get_nearby_data.dart';
import '../../data/data_sources/save_clinic_data.dart';
import '../../data/models/save_clinic_model.dart';
import '../entities/get_doctor_clinic_entity.dart';
import '../use_cases/get_doctor_clinic_use_case.dart';
import '../use_cases/nearby_use_case.dart';

abstract class BaseClinicRepository {
  Future<Either<Failure,GetNearbyData>> getNearby(FindNearbyParameters parameters);
  Future<Either<Failure,SaveClinicData>> saveClinic(SaveClinicModel saveClinicModel);
  Future<Either<Failure,GetDoctorClinicsData>> getDoctorClinics(GetDoctorClinicsParameters parameters);
}