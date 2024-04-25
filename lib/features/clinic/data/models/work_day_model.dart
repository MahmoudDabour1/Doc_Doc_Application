
import 'package:doc_doc_application/features/clinic/domain/entities/work_day_entity.dart';

class WorkDayModel extends WorkDayEntity {
  const WorkDayModel({required super.day, required super.workTimes});

  // factory WorkDayModel.fromJson(Map<String, dynamic> json) {
  //   return WorkDayModel(
  //     day: json["day"],
  //     workTimes: List<WorkTimeEntity>.from(json["workTimes"].map((e) => e)),
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      "day": day,
      "workTimes": workTimes.map((workTime) => workTime.toJson()).toList(),
    };
  }
}
