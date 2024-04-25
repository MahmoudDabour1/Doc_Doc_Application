import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../features/auth/login/data/data_sources/login_data.dart';
import '../errors/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);

}

abstract class BaseUseCase2<T, Parameters> {
  Future<LoginData> call(Parameters parameters);

}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}
