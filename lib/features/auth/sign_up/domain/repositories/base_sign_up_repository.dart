import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/features/auth/sign_up/domain/use_cases/sign_up_use_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/data_sources/sign_up_data.dart';

abstract class BaseSignUpRepository{
  Future<Either<Failure,SignUpData>> signUp(SignUpParameters parameters);
}