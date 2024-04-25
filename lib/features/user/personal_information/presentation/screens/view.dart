import 'package:doc_doc_application/core/utils/app_colors.dart';
import 'package:doc_doc_application/core/utils/app_string.dart';
import 'package:doc_doc_application/core/utils/cache_Helper.dart';
import 'package:doc_doc_application/core/utils/validator.dart';
import 'package:doc_doc_application/core/widgets/bottom_bar_screen.dart';
import 'package:doc_doc_application/core/widgets/button_widget.dart';
import 'package:doc_doc_application/core/widgets/text_form_widget.dart';
import 'package:doc_doc_application/features/user/personal_information/presentation/controller/personal_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/helper_method.dart';
import '../widgets/pick_image_widget.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = PersonaInformationCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppString.personalInformation,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.normalBlack,
          ),
        ),
      ),
      body: BlocConsumer<PersonaInformationCubit, PersonalInformationStates>(
        listener: (context, state) {
          if (state is ChangeImageFailedState) {
            showToast(msg: state.msg, color: Colors.red);
          }
          if (state is UpdateDataFailedState) {
            showToast(msg: state.msg, color: Colors.red);
          }
          if (state is UploadProfileDateSuccessState) {
            showToast(msg: state.msg);
            Navigator.pop(context);
            navigatorTo(
              context: context,
              page: BottomBarScreen(
                selectItem: 3,
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 48.h, bottom: 51.h),
                      child: const Center(child: PickImageWidget()),
                    ),
                    TextFormWidget(
                      controller: cubit.firstNameController,
                      text: AppString.firstName,
                      validation: Validator.nameValidator,
                      onSaved: (value) {
                        CacheHelper.saveLastName(value.toString());
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: TextFormWidget(
                        onSaved: (value) {
                          CacheHelper.saveFirstName(value.toString());
                        },
                        controller: cubit.lastNameController,
                        text: AppString.lastName,
                        validation: Validator.nameValidator,
                      ),
                    ),
                    TextFormWidget(
                      controller: cubit.phoneController,
                      text: AppString.phone,
                      validation: Validator.phoneValidator,
                      isLastInput: true,
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        CacheHelper.savePhone(value.toString());
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24.h, bottom: 60.h),
                      child: Text(
                        AppString.whenYou,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: AppColors.normalGray60,
                        ),
                      ),
                    ),
                    ButtonWidget(
                        btnController: cubit.btnController,
                        text: AppString.save,
                        function: () async {
                          cubit.updateProfile();
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
