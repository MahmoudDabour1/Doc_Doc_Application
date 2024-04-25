import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/core/usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../data/data_sources/profile_data.dart';
import '../repositories/base_profile_repository.dart';

class ProfileUseCase extends BaseUseCase<ProfileData, ProfileParameters> {
  final BaseProfileRepository baseProfileRepository;

  ProfileUseCase(this.baseProfileRepository);

  @override
  Future<Either<Failure, ProfileData>> call(ProfileParameters parameters)async {
    return await baseProfileRepository.getProfileData(parameters);
  }

}

class ProfileParameters extends Equatable {
  final String token;

  const ProfileParameters({required this.token});

  @override
  List<Object> get props => [token];
}
