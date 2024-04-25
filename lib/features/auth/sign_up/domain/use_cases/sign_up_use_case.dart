import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/core/usecase/base_usecase.dart';
import 'package:doc_doc_application/features/auth/sign_up/domain/repositories/base_sign_up_repository.dart';
import 'package:equatable/equatable.dart';

import '../../data/data_sources/sign_up_data.dart';

class SignUpUseCase extends BaseUseCase<SignUpData, SignUpParameters> {
  final BaseSignUpRepository baseSignUpRepository;

  SignUpUseCase(this.baseSignUpRepository);

  @override
  Future<Either<Failure, SignUpData>> call(SignUpParameters parameters) async {
    return await baseSignUpRepository.signUp(parameters);
  }
}

class SignUpParameters extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final String phone;
  final int specialityId;
  final String password;

  const SignUpParameters({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.phone,
    required this.password, required this.specialityId,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        role,
        phone,
        password,
        specialityId,
      ];
}
