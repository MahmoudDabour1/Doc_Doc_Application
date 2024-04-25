import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/exceptions.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import '../../domain/repositories/base_refresh_otp_repository.dart';
import '../../domain/use_cases/refresh_otp_use_case.dart';
import '../data_sources/refresh_otp_remote_data_source.dart';
import '../data_sources/refrest_otp_data.dart';

class RefreshOtoRepository extends BaseRefreshOtpRepository {
  final BaseRefreshOtpRemoteDataSource baseRefreshOtpRemoteDataSource;

  RefreshOtoRepository(this.baseRefreshOtpRemoteDataSource);

  @override
  Future<Either<Failure, RefreshOtpData>> refreshOtp(
      RefreshOtpParameters parameters) async {
    final result = await baseRefreshOtpRemoteDataSource.refreshOtp(parameters);
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
