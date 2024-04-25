import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/core/usecase/base_usecase.dart';
import 'package:doc_doc_application/features/auth/forget_password/domain/repositories/base_forget_password_repository.dart';
import 'package:equatable/equatable.dart';

import '../../data/data_sources/forget_password_data.dart';

class ForgetPasswordUseCase extends BaseUseCase<ForgetPasswordData,ForgetPasswordParameters>{
  final BaseForgetPasswordRepository baseForgetPasswordRepository;

  ForgetPasswordUseCase(this.baseForgetPasswordRepository);

  @override
  Future<Either<Failure, ForgetPasswordData>> call(ForgetPasswordParameters parameters) async{
    return await baseForgetPasswordRepository.submitPassword(parameters);
  }

}


class ForgetPasswordParameters extends Equatable {
  final String email;
  final String password;
  final String confirmPassword;

  const ForgetPasswordParameters(
      {required this.email, required this.password, required this.confirmPassword,});

  @override
  List<Object> get props => [email, password, confirmPassword,];
}