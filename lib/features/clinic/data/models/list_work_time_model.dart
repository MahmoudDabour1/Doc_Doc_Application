// import 'dart:convert';
//
// import 'package:doc_doc_application/features/clinic/data/models/work_time_model.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// @JsonSerializable()
// class ListTimeModel{
//   List<WorkTimeModel>? workTimeModel;
//
//   ListTimeModel({this.workTimeModel});
//
//   Map<String, dynamic> toMap() {
//     return {
//       'workTimeModel': this.workTimeModel,
//     };
//   }
//
//   factory ListTimeModel.fromMap(Map<String, dynamic> map) {
//     return ListTimeModel(
//       workTimeModel: map['workTimeModel'] as List<WorkTimeModel>,
//     );
//   }
// }