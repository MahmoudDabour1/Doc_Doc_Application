import 'package:equatable/equatable.dart';

class CheckOtpEntity  extends Equatable{
  final String message;

  const CheckOtpEntity({required this.message});

  @override
  List<Object> get props => [message];
}