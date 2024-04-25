import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/utils/cache_Helper.dart';
import '../../data/data_sources/get_nearby_data.dart';
import 'dart:ui' as ui;


class FindNearbyScreen extends StatefulWidget {
  const FindNearbyScreen({super.key});

  @override
  State<FindNearbyScreen> createState() => _FindNearbyScreenState();
}

class _FindNearbyScreenState extends State<FindNearbyScreen> {
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
    GetNearbyData.findNearbyModel
        .map(
          (findNearbyModel) =>
          Marker(
            infoWindow: InfoWindow(
              onTap: (){

              },
              title: findNearbyModel.name,
            ),
            icon: customMarkersIcon,
            position:
            LatLng(findNearbyModel.latitude, findNearbyModel.longitude),
            markerId: MarkerId(findNearbyModel.id.toString()),
          ),
    ).toSet();
    markers.addAll(myMarkers);
    setState(() {});
  }
}

