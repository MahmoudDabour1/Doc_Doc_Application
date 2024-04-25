import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:doc_doc_application/core/usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../data/data_sources/image_data.dart';
import '../repositories/base_personal_information_repository.dart';

class ImageUseCase extends BaseUseCase<ImageData, ImageParameters> {
  final BaseUpdateDataRepository baseImageRepository;

  ImageUseCase(this.baseImageRepository);

  @override
  Future<Either<Failure, ImageData>> call(ImageParameters parameters) async {
    return await baseImageRepository.sendImage(parameters);
  }

}

class ImageParameters extends Equatable {
  final String token;
  final String imageUrl;

  const ImageParameters({required this.token, required this.imageUrl});

  @override
  List<Object> get props => [token, imageUrl];
}




