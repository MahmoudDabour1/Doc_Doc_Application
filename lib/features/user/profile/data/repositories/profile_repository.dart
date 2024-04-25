import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/exceptions.dart';
import 'package:doc_doc_application/core/errors/failure.dart';

import '../../domain/repositories/base_profile_repository.dart';
import '../../domain/use_cases/profile_use_case.dart';
import '../data_sources/profile_data.dart';
import '../data_sources/profile_remote_data_source.dart';


class ProfileRepository implements BaseProfileRepository {
  final BaseProfileRemoteDataSource baseProfileRemoteDataSource;

  ProfileRepository(this.baseProfileRemoteDataSource);

  @override
  Future<Either<Failure, ProfileData>> getProfileData(
      ProfileParameters parameters) async {
    final result = await baseProfileRemoteDataSource.getProfileData(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          e.errorMessageModel.statusMessage,
        ),
      );
    }
  }
}
