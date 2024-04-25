import 'package:doc_doc_application/features/clinic/data/data_sources/get_nearby_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import '../utils/cache_Helper.dart';

class CustomGoogleMapWidget extends StatefulWidget {
  const CustomGoogleMapWidget({super.key});

  @override
  State<CustomGoogleMapWidget> createState() => _CustomGoogleMapWidgetState();
}

class _CustomGoogleMapWidgetState extends State<CustomGoogleMapWidget> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;

  @override
  void initState() {
    initialCameraPosition = CameraPosition(
      target: LatLng(CacheHelper.getLatitude(),CacheHelper.getLongitude()),
      zoom: 10,
    );
    initMarkers();
    // initPolyLines();
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
            polylines: polyLines,
            zoomControlsEnabled: false,
            markers: markers,
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (controller) {
              googleMapController = controller;
              initMapStyle();
            },
          );
  }

  Future<Uint8List> getImageFromRowDara(String image, double width) async {
    var imageData = await rootBundle.load(image);
    var imageCodec = await ui.instantiateImageCodec(
        imageData.buffer.asUint8List(),
        targetWidth: width.round());
    var imageFrame = await imageCodec.getNextFrame();
    var imageByteData =
        await imageFrame.image.toByteData(format: ui.ImageByteFormat.png);
    return imageByteData!.buffer.asUint8List();
  }

  void initMapStyle() async {
    var mapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/map_style/retro_map_style.json");
    googleMapController.setMapStyle(mapStyle);
  }

  void initMarkers() async {
    var customMarkersIcon = BitmapDescriptor.fromBytes(
        await getImageFromRowDara("assets/images/Frame.png", 100.w));
    var myMarkers =
        // places.map((e) => Marker(
        //   position: e.latLng,
        //         markerId: MarkerId(
        //       e.id.toString(),
        //     ))).toSet();
        GetNearbyData.findNearbyModel
            .map(
              (findNearbyModel) => Marker(
                infoWindow: InfoWindow(
                  title: findNearbyModel.name,
                ),
                icon: customMarkersIcon,
                position:
                    LatLng(findNearbyModel.latitude, findNearbyModel.longitude),
                markerId: MarkerId(findNearbyModel.id.toString()),
              ),
            )
            .toSet();
    markers.addAll(myMarkers);
    setState(() {});
  }

// void initPolyLines() {
//   Polyline polyline = Polyline(
//     polylineId: PolylineId('1'),
//     points: [
//       LatLng(30.71284135947559, 31.240283010482674),
//       LatLng(30.717859077324864, 31.278220173980163),
//       LatLng(30.704797708312388, 31.27152538045804),
//     ],
//   );
//   polyLines.add(polyline);
// }
}

// List<PlaceModel> places = [
//   PlaceModel(
//     1,
//     "Mahmoud",
//     LatLng(30.715444938411256, 31.260812912075522),
//   ),
//   PlaceModel(
//     2,
//     "Mahmoud",
//     LatLng(30.715476938411256, 31.26081235075522),
//   ),
//   PlaceModel(
//     3,
//     "Mahmoud",
//     LatLng(30.715444938412556, 31.2608129185075522),
//   ),
// ];
//
// class PlaceModel {
//   final int id;
//   final String name;
//   final LatLng latLng;
//
//   PlaceModel(this.id, this.name, this.latLng);
// }

// Future<Position> getCurrentLocation() async {
//   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location service is not enabled');
//   }
//   LocationPermission permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location service is not enabled');
//     }
//   }
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error("Location permissions are permanently denied");
//   }
//   return await Geolocator.getCurrentPosition();
// }