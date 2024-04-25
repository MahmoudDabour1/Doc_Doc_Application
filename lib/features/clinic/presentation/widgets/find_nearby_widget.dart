import 'package:doc_doc_application/features/clinic/data/data_sources/get_nearby_data.dart';
import 'package:doc_doc_application/features/clinic/presentation/controller/clinic_cubit.dart';
import 'package:doc_doc_application/features/clinic/presentation/widgets/single_find_nearby_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/widgets/shimmer_widget.dart';

class FindNearbyWidget extends StatelessWidget {
  const FindNearbyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClinicCubit(sl(),sl(),sl())..findNearbyData(),
      child: BlocConsumer<ClinicCubit, ClinicStates>(
        listener: (context, state) {},
        buildWhen: (previous, current) {
          return previous != current && current is FindNearbySuccessState;
        },
        builder: (context, state) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state is FindNearbyLoadingState
                  ? 10
                  : GetNearbyData.findNearbyModel!.length,
              itemBuilder: (context, index) {
                return state is FindNearbyLoadingState
                    ? Opacity(
                  opacity: 0.8,
                  child: Padding(
                    padding:EdgeInsets.only(bottom: 10.h),
                    child: ShimmerWidget(
                      width: 200.w,
                      height: 110.h,
                    ),
                  ),
                )
                    : SingleFindNearbyWidget(
                  name: GetNearbyData.findNearbyModel![index].name,
                  image: GetNearbyData.findNearbyModel![index].image,
                );
              });
        },
      ),
    );
  }
}
