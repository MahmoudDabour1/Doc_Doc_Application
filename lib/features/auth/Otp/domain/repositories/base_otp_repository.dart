import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/auth/Otp/domain/use_cases/otp_use_case.dart';

import '../../data/data_sources/otp_data.dart';

abstract class BaseOtpRepository {
  Future<Either<Failure,OtpData>> sendOtp(OtpParameters parameters);
}