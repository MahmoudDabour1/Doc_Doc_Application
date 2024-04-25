import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/auth/check_otp/data/data_sources/check_otp_data.dart';
import 'package:doc_doc_application/features/auth/check_otp/data/data_sources/check_otp_remote_data_source.dart';
import 'package:doc_doc_application/features/auth/check_otp/domain/use_cases/check_otp_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../domain/repositories/base_check_otp_repository.dart';

class CheckOtpRepository implements BaseCheckOtpRepository{
  final BaseCheckOtpRemoteDataSource baseCheckOtpRemoteDataSource;

  CheckOtpRepository(this.baseCheckOtpRemoteDataSource);

  @override
  Future<Either<Failure, CheckOtpData>> checkOtp(CheckOtpParameters parameters) async{
    final result = await baseCheckOtpRemoteDataSource.checkOtp(parameters);
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