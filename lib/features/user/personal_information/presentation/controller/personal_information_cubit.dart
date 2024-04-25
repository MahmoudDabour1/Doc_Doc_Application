import 'dart:io';
import 'package:doc_doc_application/features/user/personal_information/data/data_sources/update_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../../core/utils/cache_Helper.dart';
import '../../../../../core/utils/helper_method.dart';
import '../../data/data_sources/image_data.dart';
import '../../domain/use_cases/image_use_case.dart';
import '../../domain/use_cases/update_data_use_case.dart';

part 'personal_information_state.dart';

class PersonaInformationCubit extends Cubit<PersonalInformationStates> {
  final ImageUseCase imageUseCase;
  final UpdateDataUseCase updateDataUseCase;

  PersonaInformationCubit(this.imageUseCase, this.updateDataUseCase)
      : super(ChangeImageInitialState());

  static PersonaInformationCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  File? myImage;
  final firstNameController =
      TextEditingController(text: CacheHelper.getFirstName());
  final lastNameController =
      TextEditingController(text: CacheHelper.getLastName());
  final phoneController = TextEditingController(text: CacheHelper.getPhone());
  bool updateProfileData = false;
  bool updateImage = false;

  void updateProfile() async {
    emit(UploadProfileDateLoadingState());
    if (CacheHelper.getImage() == "") {
      showToast(msg: "Please Select Image");
      btnController.stop();
    } else {
      await imageUseCase(ImageParameters(
        token: CacheHelper.getToken(),
        imageUrl: myImage!.path,
      ));
      if (ImageData.error == false) {
        emit(ChangeImageSuccessState("Image Upload Successfully"));
        await updateDataUseCase(UpdateDataParameters(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phoneName: phoneController.text,
        ));
        if (UpdateData.error == false) {
          emit(UpdateDataSuccessState("Upload Data Successfully"));
        } else {
          emit(UpdateDataFailedState("UnSuccessfully to upload data"));
          btnController.stop();
        }
      } else {
        emit(ChangeImageFailedState("UnSuccessfully to Change Image"));
        btnController.stop();
      }
      if (state is UpdateDataSuccessState) {
        emit(UploadProfileDateSuccessState("Update profile Successfully"));
        btnController.success();
      }
    }
  }

  // void sendUserImage() async {
  //   if (formKey.currentState!.validate()) {
  //     if (myImage != null) {
  //       emit(ChangeImageLoadingState());
  //       Either<Failure, ImageData> sendImage =
  //           await imageUseCase(ImageParameters(
  //         token: CacheHelper.getToken(),
  //         imageUrl: myImage!.path,
  //       ));
  //       CacheHelper.saveImage(myImage!.path);
  //       if (ImageData.error) {
  //         emit(ChangeImageFailedState(ImageData.message));
  //       } else {
  //         emit(ChangeImageSuccessState(ImageData.message));
  //         updateImage = true;
  //         if (updateImage == true && updateProfileData == true) {
  //           emit(UpdateProfileSuccessState(
  //               UpdateData.message, updateImage, updateProfileData));
  //         }
  //       }
  //     } else {
  //       showToast(msg: "Please select Image");
  //     }
  //   }
  // }
  //
  // void updateData() async {
  //   if (formKey.currentState!.validate()) {
  //     emit(UpdateDataLoadingState());
  //     Either<Failure, UpdateData> updateData =
  //         await updateDataUseCase(UpdateDataParameters(
  //       firstName: firstNameController.text,
  //       lastName: lastNameController.text,
  //       phoneName: phoneController.text,
  //     ));
  //     if (UpdateData.error) {
  //       emit(UpdateDataFailedState(UpdateData.message));
  //     } else {
  //       updateProfileData = true;
  //       emit(UpdateDataSuccessState(UpdateData.message));
  //       if (updateImage == true && updateProfileData == true) {
  //         emit(UpdateProfileSuccessState(
  //             UpdateData.message, updateImage, updateProfileData));
  //       }
  //     }
  //   }
  // }

  void selectImage({ImageSource? source}) {
    ImagePicker.platform
        .getImageFromSource(
      source: source!,
    )
        .then((value) {
      if (value != null) {
        myImage = File(value.path);
        CacheHelper.saveImage(myImage.toString());
        Navigator.pop(navigatorKey.currentContext!);
        emit(ChangeImageLocalState());
      }
    });
  }
}
