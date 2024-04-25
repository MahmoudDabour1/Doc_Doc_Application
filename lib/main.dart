import 'package:doc_doc_application/core/utils/cache_Helper.dart';
import 'package:doc_doc_application/features/auth/login/presentation/screens/view.dart';
import 'package:doc_doc_application/features/home/home_screen/presentation/screens/view.dart';
import 'package:doc_doc_application/features/speciality/presentation/controller/get_speciality_cubit.dart';
import 'package:doc_doc_application/features/splash_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'core/bloc_observer.dart';
import 'core/services/services_locator.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/helper_method.dart';
import 'features/appointment/presentation/screens/view.dart';
import 'features/auth/refresh_otp/presentation/controller/refresh_otp_cubit.dart';
import 'features/auth/sign_up/presentation/controller/sign_up_cubit.dart';
import 'features/clinic/presentation/controller/clinic_cubit.dart';
import 'features/clinic/presentation/screens/save_clinic_screen.dart';
import 'features/speciality/presentation/screens/get_all_speciality_screen.dart';
import 'features/user/personal_information/presentation/controller/personal_information_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  // CacheHelper.clear();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RefreshOtpCubit>(
          create: (_) => sl<RefreshOtpCubit>(),
        ),
        BlocProvider<SignUpCubit>(
          create: (_) => sl<SignUpCubit>(),
        ),
        BlocProvider<GetSpecialityCubit>(
          create: (_) => sl<GetSpecialityCubit>()..getSpecialityData(),
        ),
        BlocProvider<PersonaInformationCubit>(
          create: (_) => PersonaInformationCubit(sl(), sl()),
        ), BlocProvider<ClinicCubit>(
          create: (_) => ClinicCubit(sl(),sl(),sl())..getDoctorClinics(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            builder: FToastBuilder(),
            title: 'Flutter Demo',
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.normalBlue100),
              useMaterial3: true,
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
