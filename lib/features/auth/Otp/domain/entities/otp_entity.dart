import 'package:equatable/equatable.dart';

class OtpEntity extends Equatable {
  final String message;

  const OtpEntity({required this.message});

  @override
  List<Object> get props => [message];
}