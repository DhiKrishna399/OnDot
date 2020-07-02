import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsProvider extends ChangeNotifier {
  MapType currentMapType = MapType.normal;
  Set<Marker> markers = {};
  Position currentPosition;
  LatLng center;
  
  bool isLoading = true;

  void changeLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void onCameraMove(CameraPosition position) {
    center = position.target;
  }

  void getLocation() {
    print('location getting');
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      currentPosition = position;
      center = LatLng(currentPosition.latitude, currentPosition.longitude);
      isLoading = false;
      notifyListeners();
      print('hello?');
      print(isLoading);
    }).catchError((e) {
      print(e);
    });

    print(isLoading);

  
  }
}
