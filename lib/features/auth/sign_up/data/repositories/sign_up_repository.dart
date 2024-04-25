import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/exceptions.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/auth/sign_up/data/data_sources/sign_up_remote_data_source.dart';
import 'package:doc_doc_application/features/auth/sign_up/domain/repositories/base_sign_up_repository.dart';
import 'package:doc_doc_application/features/auth/sign_up/domain/use_cases/sign_up_use_case.dart';

import '../data_sources/sign_up_data.dart';

class SignUpRepository implements BaseSignUpRepository {
  final BaseSignUpRemoteDataSource baseSignUpRemoteDataSource;

  SignUpRepository(this.baseSignUpRemoteDataSource);

  @override
  Future<Either<Failure, SignUpData>> signUp(
      SignUpParameters parameters) async {
    final result = await baseSignUpRemoteDataSource.signUp(parameters);
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
