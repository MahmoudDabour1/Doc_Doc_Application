import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/clinic/data/data_sources/clinic_remote_data_source.dart';
import 'package:doc_doc_application/features/clinic/data/data_sources/get_doctor_clinics_data.dart';
import 'package:doc_doc_application/features/clinic/domain/entities/save_clinic_entity.dart';
import 'package:doc_doc_application/features/clinic/domain/repositories/base_clinic_repository.dart';
import 'package:doc_doc_application/features/clinic/domain/use_cases/get_doctor_clinic_use_case.dart';
import 'package:doc_doc_application/features/clinic/domain/use_cases/nearby_use_case.dart';
import 'package:doc_doc_application/features/clinic/domain/use_cases/save_clinic_use_case.dart';

import '../../../../core/errors/exceptions.dart';
import '../data_sources/get_nearby_data.dart';
import '../data_sources/save_clinic_data.dart';
import '../models/save_clinic_model.dart';

class ClinicRepository extends BaseClinicRepository{
  final BaseClinicRemoteDataSource baseClinicRemoteDataSource;

  ClinicRepository(this.baseClinicRemoteDataSource);

  @override
  Future<Either<Failure, GetNearbyData>> getNearby(FindNearbyParameters parameters) async{
    final result = await baseClinicRemoteDataSource.getNearby(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SaveClinicData>> saveClinic(SaveClinicModel saveClinicModel) async{
   final result = await baseClinicRemoteDataSource.saveClinic(saveClinicModel);
   try {
     return Right(result);
   } on ServerException catch (failure) {
     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, GetDoctorClinicsData>> getDoctorClinics(GetDoctorClinicsParameters parameters)async {
    final result = await baseClinicRemoteDataSource.getDoctorClinics(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}