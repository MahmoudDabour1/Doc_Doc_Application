import 'package:doc_doc_application/features/clinic/data/models/work_day_model.dart';
import 'package:doc_doc_application/features/clinic/domain/entities/work_day_entity.dart';
import 'package:equatable/equatable.dart';

class SaveClinicEntity extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final List<WorkDayModel> workDays;


  const SaveClinicEntity({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.workDays,
  });

  @override
  List<Object> get props => [name, latitude, longitude, workDays];

}