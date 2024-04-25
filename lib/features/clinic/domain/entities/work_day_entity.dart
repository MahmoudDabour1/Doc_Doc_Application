import 'package:doc_doc_application/features/clinic/data/models/work_time_model.dart';
import 'package:doc_doc_application/features/clinic/domain/entities/work_time_entity.dart';
import 'package:equatable/equatable.dart';

class WorkDayEntity extends Equatable {
  final String day;
  final List<WorkTimeModel> workTimes;

  const WorkDayEntity({
    required this.day,
    required this.workTimes,
  });

  @override
  List<Object> get props => [day, workTimes];
}
