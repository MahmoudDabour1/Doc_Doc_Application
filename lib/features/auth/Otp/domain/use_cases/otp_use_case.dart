import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/auth/Otp/domain/repositories/base_otp_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecase/base_usecase.dart';
import '../../data/data_sources/otp_data.dart';

class OtpUseCase extends BaseUseCase<OtpData,OtpParameters> {
  final BaseOtpRepository baseOtpRepository;

  OtpUseCase(this.baseOtpRepository);

  @override
  Future<Either<Failure, OtpData>> call(OtpParameters parameters) async{
    return await baseOtpRepository.sendOtp(parameters);
  }

}

class OtpParameters extends Equatable {
  final String email;
  final String otpValue;

  const OtpParameters({required this.email, required this.otpValue});

  @override
  List<Object> get props => [email, otpValue,];

}