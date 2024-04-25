import 'package:doc_doc_application/core/utils/app_images.dart';
import 'package:doc_doc_application/features/user/personal_information/presentation/controller/personal_information_cubit.dart';
import 'package:doc_doc_application/features/user/profile/data/data_sources/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/networks/api_constance.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../personal_information/presentation/widgets/bottom_model.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonaInformationCubit, PersonalInformationStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PersonaInformationCubit.get(context);
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 150,
                    child: BottomModel(cubit: cubit),
                  );
                });
          },
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.normalGray80,
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.antiAlias,
                height: 120.h,
                width: 120.h,
                child: cubit.myImage != null?Image.file(
                  cubit.myImage!,
                  fit: BoxFit.fill,
                ):
                ProfileData.profileModel!.image != null ?Image.network(
                  "${ApiConstance.baseImageUrl}${ProfileData.profileModel!.image}",
                  fit: BoxFit.fill,
                ) :Image.asset(
                  AppImage.avatar,
                ),
        ),
              Image.asset(
                AppImage.change,
                height: 30.h,
                width: 30.w,
              ),
            ],
          ),
        );
      },
    );
  }
}
