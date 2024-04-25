import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/features/user/personal_information/data/data_sources/update_data.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/data_sources/image_data.dart';
import '../use_cases/image_use_case.dart';
import '../use_cases/update_data_use_case.dart';

abstract class BaseUpdateDataRepository{
  Future<Either<Failure,ImageData>> sendImage(ImageParameters parameters);
  Future<Either<Failure,UpdateData>> updateData(UpdateDataParameters parameters);
}
