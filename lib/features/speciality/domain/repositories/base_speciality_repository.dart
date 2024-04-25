import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/speciality/data/data_sources/get_speciality_data.dart';

abstract class BaseSpecialityRepository {
  Future<Either<Failure,GetSpecialityData>> getSpeciality();

}