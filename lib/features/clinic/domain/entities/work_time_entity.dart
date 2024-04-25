import 'package:equatable/equatable.dart';

class WorkTimeEntity extends Equatable {
  final String start;
  final String end;
  final double price;

  const WorkTimeEntity({
    required this.start,
    required this.end,
    required this.price,
  });

  @override
  List<Object> get props => [
        start,
        end,
        price,
      ];
}
