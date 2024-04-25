import 'package:doc_doc_application/features/clinic/data/data_sources/get_doctor_clinics_data.dart';
import 'package:doc_doc_application/features/clinic/presentation/controller/clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/shimmer_widget.dart';
import '../../../home/home_screen/presentation/widgets/single_recommendation_doctor_widget.dart';

class GetDoctorClinic extends StatelessWidget {
  const GetDoctorClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClinicCubit, ClinicStates>(
      listener: (context, state) {
        if (state is GetDoctorClinicsFailedState) {
          GetDoctorClinicsData.error = true;
          GetDoctorClinicsData.message = state.error;
        }
      },
      buildWhen: (previous, current) {
        return previous != current && current is GetDoctorClinicsSuccessState;
      },
      builder: (context, state) {
        return ListView.builder(
            itemCount: state is GetDoctorClinicsLoadingState
                ? 10
                : GetDoctorClinicsData.getDoctorClinicsModel!.length,
            itemBuilder: (context, index) {
              return state is GetDoctorClinicsLoadingState
                  ? Opacity(
                      opacity: 0.8,
                      child: ShimmerWidget(
                        width: 200.w,
                        height: 110.h,
                      ),
                    )
                  : SingleRecommendationDoctorWidget(
                      name: GetDoctorClinicsData
                          .getDoctorClinicsModel![index].name,
                      image: GetDoctorClinicsData
                          .getDoctorClinicsModel![index].image,
                    );
            });
      },
    );
  }
}
