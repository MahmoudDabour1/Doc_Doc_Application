import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/core/usecase/base_usecase.dart';
import 'package:doc_doc_application/features/user/personal_information/data/data_sources/update_data.dart';
import 'package:doc_doc_application/features/user/personal_information/domain/repositories/base_personal_information_repository.dart';
import 'package:equatable/equatable.dart';

class UpdateDataUseCase extends BaseUseCase<UpdateData,UpdateDataParameters>{
  final BaseUpdateDataRepository baseUpdateDataRepository;

  UpdateDataUseCase(this.baseUpdateDataRepository);

  @override
  Future<Either<Failure, UpdateData>> call(UpdateDataParameters parameters) async{
    return await baseUpdateDataRepository.updateData(parameters);

  }


}

class UpdateDataParameters extends Equatable {
  final String firstName;
  final String lastName;
  final String phoneName;

  const UpdateDataParameters({required this.firstName, required this.lastName, required this.phoneName});


  @override
  List<Object> get props => [firstName, lastName, phoneName];
}