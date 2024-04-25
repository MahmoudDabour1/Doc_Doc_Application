import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/speciality/data/data_sources/speciality_remote_data_source.dart';
import 'package:doc_doc_application/features/speciality/domain/repositories/base_speciality_repository.dart';

import '../../../../core/errors/exceptions.dart';
import '../data_sources/get_speciality_data.dart';

class SpecialityRepository extends BaseSpecialityRepository {
  final BaseSpecialityRemoteDataSource baseSpecialityRemoteDataSource;

  SpecialityRepository(this.baseSpecialityRemoteDataSource);

  @override
  Future<Either<Failure, GetSpecialityData>> getSpeciality() async {
    final result = await baseSpecialityRemoteDataSource.getSpecialityData();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
