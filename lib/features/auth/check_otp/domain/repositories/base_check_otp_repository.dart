import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/features/auth/check_otp/data/data_sources/check_otp_data.dart';

import '../../../../../core/errors/failure.dart';
import '../use_cases/check_otp_use_case.dart';

abstract class BaseCheckOtpRepository {
  Future<Either<Failure,CheckOtpData>>checkOtp(CheckOtpParameters parameters);
}