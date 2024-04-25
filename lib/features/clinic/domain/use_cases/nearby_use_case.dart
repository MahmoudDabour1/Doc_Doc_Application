import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/core/usecase/base_usecase.dart';
import 'package:doc_doc_application/features/clinic/domain/repositories/base_clinic_repository.dart';
import 'package:equatable/equatable.dart';

import '../../data/data_sources/get_nearby_data.dart';

class FindNearbyUseCase
    extends BaseUseCase<GetNearbyData, FindNearbyParameters> {
  final BaseClinicRepository baseClinicRepository;

  FindNearbyUseCase(this.baseClinicRepository);

  @override
  Future<Either<Failure, GetNearbyData>> call(
      FindNearbyParameters parameters) async {
    return await baseClinicRepository.getNearby(parameters);
  }
}

class FindNearbyParameters extends Equatable {
  final double latitude;
  final double longitude;
  final int page;

  const FindNearbyParameters({
    required this.latitude,
    required this.longitude,
    required this.page,
  });

  @override
  List<Object> get props => [
        latitude,
        longitude,
        page,
      ];
}
