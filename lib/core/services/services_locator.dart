import 'package:doc_doc_application/features/auth/Otp/data/data_sources/otp_remote_data_source.dart';
import 'package:doc_doc_application/features/auth/Otp/domain/repositories/base_otp_repository.dart';
import 'package:doc_doc_application/features/auth/Otp/domain/use_cases/otp_use_case.dart';
import 'package:doc_doc_application/features/auth/Otp/presentation/controller/otp_cubit.dart';
import 'package:doc_doc_application/features/auth/check_otp/data/repositories/check_otp_repository.dart';
import 'package:doc_doc_application/features/auth/check_otp/domain/repositories/base_check_otp_repository.dart';
import 'package:doc_doc_application/features/auth/check_otp/domain/use_cases/check_otp_use_case.dart';
import 'package:doc_doc_application/features/auth/forget_password/data/data_sources/forget_password_remote_data_source.dart';
import 'package:doc_doc_application/features/auth/forget_password/domain/repositories/base_forget_password_repository.dart';
import 'package:doc_doc_application/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:doc_doc_application/features/auth/forget_password/presentation/controller/forget_password_cubit.dart';
import 'package:doc_doc_application/features/auth/login/data/data_sources/login_data_source.dart';
import 'package:doc_doc_application/features/auth/login/data/repositories/login_repository.dart';
import 'package:doc_doc_application/features/auth/login/domain/repositories/base_login_repositories.dart';
import 'package:doc_doc_application/features/auth/login/domain/use_cases/login_use_case.dart';
import 'package:doc_doc_application/features/auth/login/presentation/controller/login_cubit.dart';
import 'package:doc_doc_application/features/auth/sign_up/data/data_sources/sign_up_remote_data_source.dart';
import 'package:doc_doc_application/features/auth/sign_up/data/repositories/sign_up_repository.dart';
import 'package:doc_doc_application/features/auth/sign_up/domain/repositories/base_sign_up_repository.dart';
import 'package:doc_doc_application/features/auth/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:doc_doc_application/features/auth/sign_up/presentation/controller/sign_up_cubit.dart';
import 'package:doc_doc_application/features/clinic/data/data_sources/clinic_remote_data_source.dart';
import 'package:doc_doc_application/features/clinic/data/repositories/clinic_repository.dart';
import 'package:doc_doc_application/features/clinic/domain/repositories/base_clinic_repository.dart';
import 'package:doc_doc_application/features/clinic/domain/use_cases/nearby_use_case.dart';
import 'package:doc_doc_application/features/clinic/domain/use_cases/save_clinic_use_case.dart';
import 'package:doc_doc_application/features/clinic/presentation/controller/clinic_cubit.dart';
import 'package:doc_doc_application/features/speciality/data/data_sources/speciality_remote_data_source.dart';
import 'package:doc_doc_application/features/user/personal_information/data/data_sources/personal_information_remote_data_source.dart';
import 'package:doc_doc_application/features/user/personal_information/domain/use_cases/update_data_use_case.dart';
import 'package:doc_doc_application/features/user/personal_information/presentation/controller/personal_information_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/Otp/data/repositories/otp_repository.dart';
import '../../features/auth/check_otp/data/data_sources/check_otp_remote_data_source.dart';
import '../../features/auth/check_otp/presentation/controller/check_otp_cubit.dart';
import '../../features/auth/forget_password/data/repositories/forget_password_repository.dart';
import '../../features/auth/refresh_otp/data/data_sources/refresh_otp_remote_data_source.dart';
import '../../features/auth/refresh_otp/data/repositories/refresh_otp_repository.dart';
import '../../features/auth/refresh_otp/domain/repositories/base_refresh_otp_repository.dart';
import '../../features/auth/refresh_otp/domain/use_cases/refresh_otp_use_case.dart';
import '../../features/auth/refresh_otp/presentation/controller/refresh_otp_cubit.dart';
import '../../features/clinic/domain/use_cases/get_doctor_clinic_use_case.dart';
import '../../features/speciality/data/repositories/speciality_repository.dart';
import '../../features/speciality/domain/repositories/base_speciality_repository.dart';
import '../../features/speciality/domain/use_cases/get_speciality_use_case.dart';
import '../../features/speciality/presentation/controller/get_speciality_cubit.dart';
import '../../features/user/profile/data/data_sources/profile_remote_data_source.dart';
import '../../features/user/personal_information/data/repositories/personal_information_repository.dart';
import '../../features/user/profile/data/repositories/profile_repository.dart';
import '../../features/user/personal_information/domain/repositories/base_personal_information_repository.dart';
import '../../features/user/profile/domain/repositories/base_profile_repository.dart';
import '../../features/user/personal_information/domain/use_cases/image_use_case.dart';
import '../../features/user/profile/domain/use_cases/profile_use_case.dart';
import '../../features/user/profile/presentation/controller/profile_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //login
    sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(
        () => LoginRemoteDataSource());

    //signup
    sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl()));
    sl.registerLazySingleton(() => SignUpUseCase(sl()));
    sl.registerLazySingleton<BaseSignUpRepository>(
        () => SignUpRepository(sl()));
    sl.registerLazySingleton<BaseSignUpRemoteDataSource>(
        () => SignUpRemoteDataSource());

    //otp
    sl.registerFactory<OtpCubit>(() => OtpCubit(sl()));
    sl.registerLazySingleton(() => OtpUseCase(sl()));
    sl.registerLazySingleton<BaseOtpRepository>(() => OtpRepository(sl()));
    sl.registerLazySingleton<BaseOtpRemoteDataSource>(
        () => OtpRemoteDataSource());


    //refresh otp
    sl.registerFactory<RefreshOtpCubit>(() => RefreshOtpCubit(sl()));
    sl.registerLazySingleton(() => RefreshOtpUseCase(sl()));
    sl.registerLazySingleton<BaseRefreshOtpRepository>(() => RefreshOtoRepository(sl()));
    sl.registerLazySingleton<BaseRefreshOtpRemoteDataSource>(() => RefreshOtpRemoteDataSource());

    //forget password
    sl.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(sl()));
    sl.registerLazySingleton(() => ForgetPasswordUseCase(sl()));
    sl.registerLazySingleton<BaseForgetPasswordRepository>(() => ForgetPasswordRepository(sl()));
    sl.registerLazySingleton<BaseForgetPasswordRemoteDataSource>(() => ForgetPasswordRemoteDataSource());

    //check otp
    sl.registerFactory<CheckOtpCubit>(() => CheckOtpCubit(sl()));
    sl.registerLazySingleton(() => CheckOtpUseCase(sl()));
    sl.registerLazySingleton<BaseCheckOtpRepository>(() => CheckOtpRepository(sl()));
    sl.registerLazySingleton<BaseCheckOtpRemoteDataSource>(() => CheckOtpRemoteDataSource());

    // profile Data
    sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl()));
    sl.registerLazySingleton(() => ProfileUseCase(sl()));
    sl.registerLazySingleton<BaseProfileRepository>(() => ProfileRepository(sl()));
    sl.registerLazySingleton<BaseProfileRemoteDataSource>(() => ProfileRemoteDataSource());

//image
    sl.registerFactory<PersonaInformationCubit>(() => PersonaInformationCubit(sl(),sl()));
    sl.registerLazySingleton(() => ImageUseCase(sl()));
    sl.registerLazySingleton<BaseUpdateDataRepository>(() => PersonalInformationRepository(sl()));
    sl.registerLazySingleton<BaseImageRemoteDataSource>(() =>ImageRemoteDataSource());

    sl.registerLazySingleton(() => UpdateDataUseCase(sl()));

    // get speciality
    sl.registerFactory<GetSpecialityCubit>(() => GetSpecialityCubit(sl()));
    sl.registerLazySingleton(() => GetSpecialityUseCase(sl()));
    sl.registerLazySingleton<BaseSpecialityRepository>(() => SpecialityRepository(sl()));
    sl.registerLazySingleton<BaseSpecialityRemoteDataSource>(() => SpecialityRemoteDataSource());

    sl.registerFactory<ClinicCubit>(() => ClinicCubit(sl(),sl(),sl()));
    sl.registerLazySingleton(() => SaveClinicUseCase(sl()));
    sl.registerLazySingleton(() => FindNearbyUseCase(sl()));
    sl.registerLazySingleton(() => GetDoctorUseCase(sl()));
    sl.registerLazySingleton<BaseClinicRepository>(() => ClinicRepository(sl()));
    sl.registerLazySingleton<BaseClinicRemoteDataSource>(() => ClinicRemoteDataSource());
  }
}
