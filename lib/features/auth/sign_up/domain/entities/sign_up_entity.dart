
import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String message;

  const SignUpEntity({required this.message});

  @override
  List<Object> get props => [message];
}