import 'package:doc_doc_application/core/widgets/shimmer_widget.dart';
import 'package:doc_doc_application/features/home/home_screen/presentation/widgets/single_doctor_speciality_widget.dart';
import 'package:doc_doc_application/features/speciality/data/data_sources/get_speciality_data.dart';
import 'package:doc_doc_application/features/speciality/presentation/controller/get_speciality_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorSpecialityWidget extends StatelessWidget {
  const DoctorSpecialityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetSpecialityCubit, GetSpecialityStates>(
      listener: (context, state) {
        if (state is GetSpecialityFailedState) {
          GetSpecialityData.error = true;
          GetSpecialityData.message = state.error;
        }
      },
      buildWhen: (previous, current) {
        return previous != current && current is GetSpecialitySuccessState;
      },
      builder: (context, state) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: state is GetSpecialityLoadingState
              ? 5
              : GetSpecialityData.getSpecialityModel!.length,
          itemBuilder: (context, index) {
            return state is GetSpecialityLoadingState
                ? Opacity(
                    opacity: 0.8,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Container(
                          height: 20.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffDADADA)),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: Column(
                                children: [
                                  ShimmerWidget(
                                    height: 56.h,
                                    width: 56.w,
                                    isCircular: true,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  ShimmerWidget(height: 10.h, width: 60.w),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Container(
                      height: 20.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffDADADA)),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: SingleDoctorSpecialityWidget(
                          name:
                              GetSpecialityData.getSpecialityModel![index].name,
                          image: GetSpecialityData.getSpecialityModel![index].image,
                        ),
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
