import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/core/usecase/base_usecase.dart';
import 'package:doc_doc_application/features/auth/check_otp/data/data_sources/check_otp_data.dart';
import 'package:doc_doc_application/features/auth/check_otp/domain/repositories/base_check_otp_repository.dart';
import 'package:equatable/equatable.dart';

class CheckOtpUseCase extends BaseUseCase<CheckOtpData, CheckOtpParameters> {

  final BaseCheckOtpRepository baseCheckOtpRepository;

  CheckOtpUseCase(this.baseCheckOtpRepository);

  @override
  Future<Either<Failure, CheckOtpData>> call(CheckOtpParameters parameters)async {
    return await baseCheckOtpRepository.checkOtp(parameters);
  }
}


class CheckOtpParameters extends Equatable {
  final String email;
  final String otpValue;

  const CheckOtpParameters({required this.email, required this.otpValue});

  @override
  List<Object> get props => [email, otpValue];

}