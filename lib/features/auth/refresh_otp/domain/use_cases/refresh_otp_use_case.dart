import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecase/base_usecase.dart';
import '../../data/data_sources/refrest_otp_data.dart';
import '../repositories/base_refresh_otp_repository.dart';

class RefreshOtpUseCase extends BaseUseCase<RefreshOtpData,RefreshOtpParameters> {
  final BaseRefreshOtpRepository baseRefreshOtpRepository;

  RefreshOtpUseCase(this.baseRefreshOtpRepository);

  @override
  Future<Either<Failure, RefreshOtpData>> call(RefreshOtpParameters parameters) async{
    return await baseRefreshOtpRepository.refreshOtp(parameters);
  }

}

class RefreshOtpParameters extends Equatable {
  final String email;

  const RefreshOtpParameters({required this.email});

  @override
  List<Object> get props => [email];
}