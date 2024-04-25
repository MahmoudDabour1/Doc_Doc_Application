import 'package:doc_doc_application/core/utils/app_string.dart';
import 'package:doc_doc_application/core/widgets/above_text_widget.dart';
import 'package:doc_doc_application/core/widgets/button_widget.dart';
import 'package:doc_doc_application/core/widgets/text_button_widget.dart';
import 'package:doc_doc_application/core/widgets/text_form_widget.dart';
import 'package:doc_doc_application/features/clinic/data/models/work_time_model.dart';
import 'package:doc_doc_application/features/clinic/presentation/controller/clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constance.dart';
import '../../../../core/utils/helper_method.dart';

class SaveClinicScreen extends StatefulWidget {
  const SaveClinicScreen({super.key});

  @override
  State<SaveClinicScreen> createState() => _SaveClinicScreenState();
}

class _SaveClinicScreenState extends State<SaveClinicScreen> {
  RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  bool add = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ClinicCubit, ClinicStates>(
        listener: (context, state) {
          if (state is FindNearbyFailedState) {
            print(state.error);
            showToast(msg: state.error);
          }
          if (state is FindNearbySuccessState) {
            print("Success");
          }
          if (state is ClinicLoadingState) {
            btnController.stop();
          }
        },
        builder: (context, state) {
          var cubit = ClinicCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AboveTextWidget(
                    titleText: AppString.saveClinic,
                    subTitleText: AppString.saveClinic,
                  ),
                  TextFormWidget(
                      controller: cubit.nameController, text: "Clinic Name"),
                  Row(
                    children: [
                      Checkbox(
                          value: cubit.isRemember,
                          onChanged: (value) {
                            cubit.getCurrentLocation().then((value) {
                              cubit.latitude = value.latitude;
                              cubit.longitude = value.longitude;
                            });
                            setState(() {
                              cubit.isRemember = !cubit.isRemember;
                            });
                          }),
                      Text(
                        "Select Current Location",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.normalGray60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 15.w),
                  //   child: TextFormWidget(
                  //     controller: cubit.locationController,
                  //     text: "Location",
                  //     onTap: () {
                  //       cubit.getCurrentLocation().then((value) {
                  //         cubit.locationController..text = value.toString();
                  //       });
                  //     },
                  //   ),
                  // ),
                  TextButtonWidget(
                      text: "Add Work days",
                      function: () {
                        add = true;
                        setState(() {});
                      }),
                  add
                      ? Column(
                          children: [
                            DropdownButtonFormField<String>(
                              value: AppConstance.dayValue,
                              items: AppConstance.days
                                  .map((String item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(item),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                cubit.day = value.toString();
                                print(value);
                              },
                              decoration: InputDecoration(
                                hintText: AppString.role,
                                hintStyle: TextStyle(
                                  color: AppColors.normalGray60,
                                  fontSize: 14.sp,
                                ),
                                filled: true,
                                fillColor: AppColors.normalGray20,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 17.h),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.sp),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormWidget(
                                      controller: cubit.startTimeController,
                                      text: "Start Time",
                                      onTap: () async {
                                        TimeOfDay? picked =
                                            await showTimePicker(
                                          context: context,
                                          initialTime: cubit.startTime,
                                          builder: (BuildContext context,
                                              Widget? child) {
                                            return MediaQuery(
                                              data: MediaQuery.of(context)
                                                  .copyWith(
                                                      alwaysUse24HourFormat:
                                                          false),
                                              child: child!,
                                            );
                                          },
                                          initialEntryMode:
                                              TimePickerEntryMode.dial,
                                        );
                                        if (picked != null &&
                                            picked != cubit.startTime) {
                                          cubit.startTimeController.text =
                                              picked.format(context).toString();
                                          // String formatTime = DateFormat('hh:mm a').format(picked as DateTime);
                                          setState(() {
                                            cubit.startTime = picked;
                                            print(picked);
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: TextFormWidget(
                                      controller: cubit.endTimeController,
                                      text: "End Time",
                                      onTap: () async {
                                        TimeOfDay? picked =
                                            await showTimePicker(
                                          context: context,
                                          initialTime: cubit.endTime,
                                          initialEntryMode:
                                              TimePickerEntryMode.dial,
                                        );
                                        if (picked != null &&
                                            picked != cubit.endTime) {
                                          cubit.endTimeController.text =
                                              picked.format(context).toString();
                                          setState(() {
                                            cubit.endTime = picked;
                                            print(picked);
                                          });
                                        }
                                      },
                                      onSaved: (value) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFormWidget(
                              controller: cubit.priceController,
                              text: "Price",
                              onSaved: (value) {},
                            ),
                            // ElevatedButton(
                            //     onPressed: () {
                            //       // cubit.mapOfDays.addAll({
                            //       //   'day': cubit.day,
                            //       //   'workTimes':cubit.mapOfTimes,
                            //       // });
                            //       // cubit.mapOfTimes.addAll({
                            //       //   'start': cubit.startTime.format(context),
                            //       //   'end': cubit.endTime.format(context),
                            //       //   'price': cubit.priceController.text,
                            //       // });
                            //       // // add = false;
                            //       // setState(() {});
                            //
                            //       // cubit.listTimeModel.workTimeModel?.add(
                            //       //   WorkTimeModel(
                            //       //     start: cubit.startTime.format(context),
                            //       //     end: cubit.endTime.format(context),
                            //       //     price: cubit.priceController.text,
                            //       //   ),
                            //       // );
                            //       // print(cubit.listTimeModel.toString());
                            //     },
                            //     child: Text("save")),
                          ],
                        )
                      : SizedBox(),

                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: ButtonWidget(
                      text: "Save Clinic",
                      function: () {
                        cubit.saveClinic(context);
                      },
                      btnController: btnController,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
