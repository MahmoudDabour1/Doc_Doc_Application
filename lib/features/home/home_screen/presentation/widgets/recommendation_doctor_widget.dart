// import 'package:doc_doc_application/features/clinic/data/data_sources/get_nearby_data.dart';
// import 'package:doc_doc_application/features/clinic/presentation/controller/clinic_cubit.dart';
// import 'package:doc_doc_application/features/home/home_screen/presentation/widgets/single_recommendation_doctor_widget.dart';
// import 'package:doc_doc_application/features/speciality/data/models/get_speciality_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';
//
// import '../../../../../core/services/services_locator.dart';
// import '../../../../../core/widgets/shimmer_widget.dart';
//
// class RecommendationDoctorWidget extends StatelessWidget {
//   const RecommendationDoctorWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         scrollDirection: Axis.vertical,
//         physics: const BouncingScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: state is FindNearbyLoadingState
//             ? 10
//             : GetNearbyData.findNearbyModel!.length,
//         itemBuilder: (context, index) {
//           return state is FindNearbyLoadingState
//               ? Opacity(
//                   opacity: 0.8,
//                   child: ShimmerWidget(
//                     width: 200.w,
//                     height: 110.h,
//                   ),
//                 )
//               : SingleRecommendationDoctorWidget(
//                   name: GetNearbyData.findNearbyModel![index].name,
//                   image: GetNearbyData.findNearbyModel![index].image,
//                 );
//         });
//   }
// }
