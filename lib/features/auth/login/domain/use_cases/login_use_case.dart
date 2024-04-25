

import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/auth/login/data/data_sources/login_data.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecase/base_usecase.dart';
import '../repositories/base_login_repositories.dart';

class LoginUseCase extends BaseUseCase<LoginData, LoginParameters> {
  final BaseLoginRepository baseLoginRepository;

  LoginUseCase(this.baseLoginRepository);

  @override
  Future<Either<Failure,LoginData>> call(LoginParameters parameters) async{
    return await baseLoginRepository.login(parameters);
  }
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
