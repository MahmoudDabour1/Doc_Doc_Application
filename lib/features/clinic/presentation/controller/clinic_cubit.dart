import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:doc_doc_application/core/constants/constants.dart';
import 'package:doc_doc_application/core/utils/cache_Helper.dart';
import 'package:doc_doc_application/features/clinic/data/data_sources/get_doctor_clinics_data.dart';
import 'package:doc_doc_application/features/clinic/data/data_sources/get_nearby_data.dart';
import 'package:doc_doc_application/features/clinic/data/data_sources/save_clinic_data.dart';
import 'package:doc_doc_application/features/clinic/data/models/list_work_time_model.dart';
import 'package:doc_doc_application/features/clinic/data/models/save_clinic_model.dart';
import 'package:doc_doc_application/features/clinic/data/models/work_day_model.dart';
import 'package:doc_doc_application/features/clinic/data/models/work_time_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../../domain/use_cases/get_doctor_clinic_use_case.dart';
import '../../domain/use_cases/nearby_use_case.dart';
import '../../domain/use_cases/save_clinic_use_case.dart';

part 'clinic_state.dart';

class ClinicCubit extends Cubit<ClinicStates> {
  final FindNearbyUseCase findNearbyUseCase;

  final SaveClinicUseCase saveClinicUseCase;
  final GetDoctorUseCase getDoctorUseCase;

  ClinicCubit(
      this.findNearbyUseCase, this.saveClinicUseCase, this.getDoctorUseCase)
      : super(ClinicInitialState());

  static ClinicCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final dayController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final priceController = TextEditingController();
  late String day;
  late double latitude;
  late double longitude;
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  Map<String, dynamic> mapOfDays = {};
  Map<String, dynamic> mapOfTimes = {};
  List<Map<String, dynamic>> workDaysList = [];
  List<Map<String, dynamic>> workTimesList = [];
  final int clinicId = 0;
  final int page = 0;

  List<WorkDayModel> workDays = [
    WorkDayModel(
      day: "Tuesday",
      workTimes: [
        WorkTimeModel(start: "10:00 AM", end: "02:00 PM", price: 22.5),
        WorkTimeModel(start: "03:00 PM", end: "07:00 PM", price: 21.7),
      ],
    ),
    WorkDayModel(
      day: "Thursday",
      workTimes: [
        WorkTimeModel(start: "09:00 AM", end: "01:00 PM", price: 150),
        WorkTimeModel(start: "02:00 PM", end: "06:00 PM", price: 15),
      ],
    ),
    WorkDayModel(
      day: "Saturday",
      workTimes: [
        WorkTimeModel(start: "08:00 AM", end: "12:00 PM", price: 54),
        WorkTimeModel(start: "01:00 PM", end: "05:00 PM", price: 15.56),
      ],
    ),
  ];

  // ListTimeModel listTimeModel = ListTimeModel();

  List<Map<String, dynamic>> timeList = <Map<String, String>>[];
  bool isRemember = false;

  void saveClinic(BuildContext context) async {
    emit(ClinicLoadingState());
    // for(var element in timeList) {
    //   Map<String, dynamic> val ={
    //     "start": mapOfTimes.entries.map((e) => e.value),
    //     "end":mapOfTimes.entries.map((e) => e.value),
    //     "price": mapOfTimes.entries.map((e) => e.value),
    //   };
    //   timeList.add(val);
    // }

    // List<Map<String, dynamic>> clinicDataList = clinicData.workDays.map((workDay) {
    //   return {
    //     "day": workDay.day,
    //     "workTimes": workDay.workTimes.map((workTime) {
    //       return {
    //         "start": workTime.start,
    //         "end": workTime.end,
    //         "price": workTime.price,
    //       };
    //     }).toList(),
    //   };
    // }).toList();

    // Map<String, dynamic> requestData = {
    //   "name": nameController.text,
    //   "latitude": latitude,
    //   "longitude": longitude,
    //   "workDays": [
    //     {
    //       "day": day,
    //       "workTimes": timeList,
    //     },
    //   ]
    // };

    // timesList(){
    //   return mapOfTimes.entries.map((e){
    //     return {
    //       "start": e.value,
    //       "end":  e.value,
    //       "price": e.value,
    //     };
    //   });
    // }

    // List<Map<String, dynamic>> workDaysList = [];
    // for (var workDay in requestData["workDays"]) {
    //   List<Map<String, dynamic>> workTimesList = [];
    //   for (var workTime in workDay["workTimes"]) {
    //     workTimesList.add(workTime);
    //   }
    //   workDaysList.add({"day": workDay["day"], "workTimes": workTimesList});
    // }
    //
    // Map<String, dynamic> finalList = {
    //   "name": nameController.text,
    //   "latitude": latitude,
    //   "longitude": longitude,
    //   "workDays": workTimesList
    // };
    // List<Map<String, dynamic>> finalList = [
    //   "name": requestData["name"],
    //   {"latitude": requestData["latitude"]},
    //   {"longitude": requestData["longitude"]},
    //   {"workDays": workDaysList},
    // ];
    final result = await saveClinicUseCase(
       SaveClinicModel(
        name: nameController.text,
        latitude: latitude,
        longitude: longitude,
        workDays: workDays,
      ),
    );
    print(workDays.toList());
    if (SaveClinicData.error) {
      emit(ClinicFailedState(error: SaveClinicData.message));
    } else {
      emit(ClinicSuccessState(message: SaveClinicData.message));
    }
  }

  void getDoctorClinics() async {
    emit(GetDoctorClinicsLoadingState());
    await getDoctorUseCase(
      GetDoctorClinicsParameters(
        page: page,
        id: clinicId,
      ),
    );
    if (GetDoctorClinicsData.error) {
      emit(GetDoctorClinicsFailedState(error: GetDoctorClinicsData.message));
    } else {
      emit(GetDoctorClinicsSuccessState(error: GetDoctorClinicsData.message));
    }
  }

  findNearbyData() async {
    emit(FindNearbyLoadingState());
    getCurrentLocation().then((value) async {
      latitude = value.latitude;
      longitude = value.longitude;
      CacheHelper.saveLatitude(latitude);
      CacheHelper.saveLongitude(longitude);
    });
    emit(GetCurrentLocationSuccessState());
    await findNearbyUseCase(FindNearbyParameters(
      latitude: latitude,
      longitude: longitude,
      page: 0,
    ));
    if (GetNearbyData.error) {
      print(GetNearbyData.message);
      emit(FindNearbyFailedState(error: GetNearbyData.message));
    } else {
      emit(FindNearbySuccessState(error: GetNearbyData.message));
    }
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service is not enabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location service is not enabled');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied");
    }
    return await Geolocator.getCurrentPosition();
  }

  void liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }
}
