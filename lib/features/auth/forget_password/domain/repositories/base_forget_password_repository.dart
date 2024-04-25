import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';

import '../../data/data_sources/forget_password_data.dart';

abstract class BaseForgetPasswordRepository {
  Future<Either<Failure, ForgetPasswordData>> submitPassword(
      ForgetPasswordParameters parameters);
}
