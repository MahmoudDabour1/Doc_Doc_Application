import 'package:doc_doc_application/features/clinic/domain/entities/work_time_entity.dart';

class WorkTimeModel extends WorkTimeEntity{
  const WorkTimeModel({required super.start, required super.end, required super.price});

  // factory WorkTimeModel.fromJson(Map<String, dynamic> json)
  //
  // {
  //   return WorkTimeModel(
  //     start: json["start"],
  //     end: json["end"],
  //     price: json["price"],
  //   );
  // }

  Map<String, dynamic> toJson()

  {
    return {
      "start": start,
      "end": end,
      "price":price,
    };
  }
}