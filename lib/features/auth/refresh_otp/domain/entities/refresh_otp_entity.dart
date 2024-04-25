import 'package:equatable/equatable.dart';

class RefreshOtoEntity extends Equatable {
  final String message;

  const RefreshOtoEntity({required this.message});

  @override
  List<Object> get props => [message];
}
