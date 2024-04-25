import 'package:doc_doc_application/features/user/personal_information/domain/entities/update_data_entity.dart';

class UpdateDataModel extends UpdateDataEntity{
  const UpdateDataModel({required super.message});

  factory UpdateDataModel.fromJson(Map<String, dynamic> json) {
    return UpdateDataModel(
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message':message,
    };
  }
}