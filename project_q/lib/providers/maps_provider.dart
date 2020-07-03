import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsProvider extends ChangeNotifier {

  MapType currentMapType = MapType.normal;
  Set<Marker> markers = {};
  Position currentPosition;
  LatLng center;
  
  bool isLoading = false;

  void changeLoadingState() {
    isLoading = true;
    notifyListeners();
  }

  void onCameraMove(CameraPosition position) {
    center = position.target;
  }

  void getLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      currentPosition = position;
      center = LatLng(currentPosition.latitude, currentPosition.longitude);
      isLoading = true;
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }


}
