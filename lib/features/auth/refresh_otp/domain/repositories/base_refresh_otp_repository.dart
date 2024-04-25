import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/data_sources/refrest_otp_data.dart';
import '../use_cases/refresh_otp_use_case.dart';

abstract class BaseRefreshOtpRepository {
  Future<Either<Failure,RefreshOtpData>> refreshOtp(RefreshOtpParameters parameters);

}