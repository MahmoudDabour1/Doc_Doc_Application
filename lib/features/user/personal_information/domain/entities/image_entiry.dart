import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String message;

  const ImageEntity({required this.message});

  @override
  List<Object> get props => [message];
}