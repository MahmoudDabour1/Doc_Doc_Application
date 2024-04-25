import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/core/usecase/base_usecase.dart';
import 'package:doc_doc_application/features/speciality/domain/repositories/base_speciality_repository.dart';

import '../../data/data_sources/get_speciality_data.dart';

class GetSpecialityUseCase extends BaseUseCase<GetSpecialityData,NoParameters>{
  final BaseSpecialityRepository baseSpecialityRepository;

  GetSpecialityUseCase(this.baseSpecialityRepository);

  @override
  Future<Either<Failure, GetSpecialityData>> call(NoParameters parameters)async {
    return await baseSpecialityRepository.getSpeciality();
  }

}