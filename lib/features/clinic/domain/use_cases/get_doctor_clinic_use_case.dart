import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/clinic/domain/entities/get_doctor_clinic_entity.dart';
import 'package:doc_doc_application/features/clinic/domain/repositories/base_clinic_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../data/data_sources/get_doctor_clinics_data.dart';

class GetDoctorUseCase extends BaseUseCase<GetDoctorClinicsData,GetDoctorClinicsParameters>{
  final BaseClinicRepository baseClinicRepository;

  GetDoctorUseCase(this.baseClinicRepository);

  @override
  Future<Either<Failure, GetDoctorClinicsData>> call(GetDoctorClinicsParameters parameters) async {
    return await baseClinicRepository.getDoctorClinics(parameters);
  }


}


class GetDoctorClinicsParameters extends Equatable {

  final int page;
  final int id;

  const GetDoctorClinicsParameters({
    required this.page,
    required this.id,
  });

  @override
  List<Object> get props => [page, id];

}