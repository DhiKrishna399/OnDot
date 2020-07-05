import 'dart:async';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_q/models/event_dummy.dart';

class MapsProvider extends ChangeNotifier {
  MapType currentMapType = MapType.normal;
  Set<Marker> eventMarkers = {};
  Position currentPosition;
  LatLng center;

  GoogleMapController mapsController;

  bool isLoading = false;

  void displayEventMarkers() {
    eventDummy.forEach((element) {
      eventMarkers.add(
        Marker(
          markerId: MarkerId(element.title),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.title, snippet: element.description),
          position: element.locationCoords,
        ),
      );
    });
  }

  void changeLoadingState() {
    isLoading = true;
    notifyListeners();
  }

  void mapCreated(GoogleMapController mapsController) {
    mapsController = mapsController;
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

  // void moveCamera() {
    
  //   mapsController.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: LatLng(38.016536, -122.137974),
  //         zoom: 14,
  //         bearing: 45,
  //         tilt: 45,
  //       ),
  //     ),
  //   );
  //   mapCreated(mapsController);
  //   notifyListeners();
  // }

  // Future<void> animateTo() async {
  //   final GoogleMapController c = await mapsController.future;

  //   final p = CameraPosition(
  //       target: LatLng(38.016536, -122.137974),
  //       zoom: 14.4746);
         
  //   c.animateCamera(CameraUpdate.newCameraPosition(p));

  //   notifyListeners();
  // }

  void test() {
    print('hello');
  }
}
