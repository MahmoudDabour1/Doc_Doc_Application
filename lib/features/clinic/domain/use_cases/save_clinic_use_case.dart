import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/features/clinic/data/models/save_clinic_model.dart';
import 'package:doc_doc_application/features/clinic/domain/entities/save_clinic_entity.dart';
import 'package:doc_doc_application/features/clinic/domain/repositories/base_clinic_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../data/data_sources/save_clinic_data.dart';

class SaveClinicUseCase extends BaseUseCase<SaveClinicData,SaveClinicModel> {
  final BaseClinicRepository baseClinicRepository;

  SaveClinicUseCase(this.baseClinicRepository);

  @override
  Future<Either<Failure, SaveClinicData>> call(SaveClinicModel saveClinicModel) async{
    return await baseClinicRepository.saveClinic(saveClinicModel);
  }

}


class SaveClinicParameters extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final String day;
  final String start;
  final String end;
  final double price;

  const SaveClinicParameters(
      {required this.name, required this.latitude, required this.longitude, required this.day,
        required this.start, required this.end, required this.price});


  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "latitude": latitude,
      "longitude": longitude,
      "day": day,
      "start": start,
      "end": end,
      "price": price,
    };
  }


  @override
  List<Object> get props =>
      [name, latitude, longitude, day, start, end, price,];


}