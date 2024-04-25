import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:doc_doc_application/core/widgets/shimmer_widget.dart';
import 'package:doc_doc_application/features/speciality/data/data_sources/get_speciality_data.dart';
import 'package:doc_doc_application/features/speciality/presentation/controller/get_speciality_cubit.dart';
import 'package:doc_doc_application/features/speciality/presentation/controller/get_speciality_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/single_item_grad_view_speciality.dart';

class GetAllSpecialityScreen extends StatelessWidget {
  const GetAllSpecialityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:  Padding(
          padding:  EdgeInsets.all(8.w),
          child: Container(
            width: 20.w,
            decoration: BoxDecoration( color: AppColors.normalBlue80,
              borderRadius: BorderRadius.circular(10.r)
            ),
            child: IconButton(
              icon:  Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors.normalWhite,
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: BlocConsumer<GetSpecialityCubit, GetSpecialityStates>(
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
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 3.sp,
                mainAxisSpacing: 2.sp,
                childAspectRatio: 1 / 1.9,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  state is GetSpecialityLoadingState
                      ? 9
                      : GetSpecialityData.getSpecialityModel!.length,
                  (index) => state is GetSpecialityLoadingState
                      ? Column(
                          children: [
                            ShimmerWidget(
                              height: 80.h,
                              width: 80.w,
                              isCircular: true,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ShimmerWidget(
                              height: 15.h,
                              width: 80.w,
                            ),
                          ],
                        )
                      : SingleItemGradViewSpeciality(
                          image: GetSpecialityData
                              .getSpecialityModel![index].image,
                          name:
                              GetSpecialityData.getSpecialityModel![index].name,
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
