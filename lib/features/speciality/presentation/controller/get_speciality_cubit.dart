import 'package:doc_doc_application/core/usecase/base_usecase.dart';
import 'package:doc_doc_application/features/speciality/data/data_sources/get_speciality_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_speciality_use_case.dart';

part 'get_speciality_state.dart';

class GetSpecialityCubit extends Cubit<GetSpecialityStates> {
  final GetSpecialityUseCase getSpecialityUseCase;
  bool isDone = false;

  GetSpecialityCubit(this.getSpecialityUseCase)
      : super(GetSpecialityInitialState());

  static GetSpecialityCubit get(context) => BlocProvider.of(context);

   getSpecialityData() async {
    emit(GetSpecialityLoadingState());
     await getSpecialityUseCase(const NoParameters());
    if (GetSpecialityData.error) {
      emit(GetSpecialityFailedState(error: GetSpecialityData.message));
    } else {
      isDone = true;
      emit(GetSpecialitySuccessState(msg: GetSpecialityData.message));
    }
  }
}
