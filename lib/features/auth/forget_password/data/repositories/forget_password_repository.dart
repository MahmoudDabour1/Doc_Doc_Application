import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/exceptions.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/auth/forget_password/data/data_sources/forget_password_remote_data_source.dart';
import 'package:doc_doc_application/features/auth/forget_password/domain/repositories/base_forget_password_repository.dart';
import 'package:doc_doc_application/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';

import '../data_sources/forget_password_data.dart';

class ForgetPasswordRepository extends BaseForgetPasswordRepository{
  final BaseForgetPasswordRemoteDataSource baseForgetPasswordRemoteDataSource;

  ForgetPasswordRepository(this.baseForgetPasswordRemoteDataSource);

  @override
  Future<Either<Failure, ForgetPasswordData>> submitPassword(ForgetPasswordParameters parameters) async {
   final result = await  baseForgetPasswordRemoteDataSource.submitPassword(parameters);
   try {
     return Right(result);
   }on ServerException catch(e) {
     return Left(
       ServerFailure(
         e.errorMessageModel.statusMessage,
       ),
     );
   }
  }

}