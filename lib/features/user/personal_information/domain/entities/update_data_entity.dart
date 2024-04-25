import 'package:equatable/equatable.dart';

class UpdateDataEntity extends Equatable {
  final String message;

  const UpdateDataEntity({required this.message});

  @override
  List<Object> get props => [message];
}