import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/exceptions.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/auth/Otp/data/data_sources/otp_remote_data_source.dart';
import 'package:doc_doc_application/features/auth/Otp/domain/repositories/base_otp_repository.dart';
import 'package:doc_doc_application/features/auth/Otp/domain/use_cases/otp_use_case.dart';

import '../data_sources/otp_data.dart';

class OtpRepository implements BaseOtpRepository {
  final BaseOtpRemoteDataSource baseOtpRemoteDataSource;

  OtpRepository(this.baseOtpRemoteDataSource);

  @override
  Future<Either<Failure, OtpData>> sendOtp(OtpParameters parameters) async {
    final result = await baseOtpRemoteDataSource.sendOtp(parameters);
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
