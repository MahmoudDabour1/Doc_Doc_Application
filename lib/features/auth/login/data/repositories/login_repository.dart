
import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/exceptions.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/auth/login/data/data_sources/login_data_source.dart';
import 'package:doc_doc_application/features/auth/login/data/data_sources/login_data.dart';
import 'package:doc_doc_application/features/auth/login/domain/repositories/base_login_repositories.dart';
import 'package:doc_doc_application/features/auth/login/domain/use_cases/login_use_case.dart';


class LoginRepository implements BaseLoginRepository {
 final BaseLoginRemoteDataSource baseLoginRemoteDataSource;
 LoginRepository(this.baseLoginRemoteDataSource);

  @override
  Future<Either<Failure,LoginData>> login(LoginParameters parameters) async {

    final result = await baseLoginRemoteDataSource.login(parameters);
    try{
     return Right(result);
    }on ServerException catch (e) {
     return Left(
      ServerFailure(
       e.errorMessageModel.statusMessage,
      ),
     );
    }
  }
}
