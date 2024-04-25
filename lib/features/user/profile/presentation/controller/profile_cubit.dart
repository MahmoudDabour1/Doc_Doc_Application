
import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/errors/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/cache_Helper.dart';
import '../../data/data_sources/profile_data.dart';
import '../../data/models/profile_model.dart';
import '../../domain/use_cases/profile_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final ProfileUseCase profileUseCase;


  ProfileCubit(this.profileUseCase) : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);


   getProfileData() async {
    emit(ProfileLoadingState());
    Either<Failure, ProfileData> getProfileData = await profileUseCase(
      ProfileParameters(
        token: CacheHelper.getToken(),
      ),
    );
    if (ProfileData.error) {
      emit(ProfileFailedState(ProfileData.message));
    } else {
      emit(ProfileSuccessState(ProfileData.profileModel!));
    }
  }


}
