import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String token;
  final String message;


  const LoginEntity({required this.token,required this.message});

  @override
  List<Object> get props => [token,message];
}
