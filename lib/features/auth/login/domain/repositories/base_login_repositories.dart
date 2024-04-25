import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/auth/login/data/data_sources/login_data.dart';
import 'package:doc_doc_application/features/auth/login/domain/use_cases/login_use_case.dart';

abstract class BaseLoginRepository {
  Future<Either<Failure,LoginData>>login(LoginParameters parameters);
}