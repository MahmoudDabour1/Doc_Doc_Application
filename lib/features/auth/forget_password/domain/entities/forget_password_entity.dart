import 'package:equatable/equatable.dart';

class ForgetPasswordEntity extends Equatable {

  final String message;

  const ForgetPasswordEntity({required this.message});

  @override
  List<Object> get props => [message];
}