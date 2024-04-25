
import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/user/personal_information/data/data_sources/update_data.dart';
import 'package:doc_doc_application/features/user/personal_information/domain/use_cases/update_data_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../domain/repositories/base_personal_information_repository.dart';
import '../../domain/use_cases/image_use_case.dart';
import '../data_sources/image_data.dart';
import '../data_sources/personal_information_remote_data_source.dart';

class PersonalInformationRepository implements BaseUpdateDataRepository{
  final BaseImageRemoteDataSource baseImageRemoteDataSource;

  PersonalInformationRepository(this.baseImageRemoteDataSource);

  @override
  Future<Either<Failure, ImageData>> sendImage(ImageParameters parameters) async{
   final result  = await baseImageRemoteDataSource.changeImage(parameters);
   try {
     return Right(result);
   } on ServerException catch (e) {
     return Left(
       ServerFailure(
         e.errorMessageModel.statusMessage,
       ),
     );
   }
  }

  @override
  Future<Either<Failure, UpdateData>> updateData(UpdateDataParameters parameters) async{
    final result = await baseImageRemoteDataSource.updateData(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          e.errorMessageModel.statusMessage,
        ),
      );
    }

  }

}