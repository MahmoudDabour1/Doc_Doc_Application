import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/data_sources/profile_data.dart';
import '../use_cases/profile_use_case.dart';


abstract class BaseProfileRepository {
  Future<Either<Failure, ProfileData>> getProfileData(
      ProfileParameters parameters);


}
