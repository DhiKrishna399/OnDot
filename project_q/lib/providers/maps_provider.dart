import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_q/models/event_dummy.dart';

class MapsProvider extends ChangeNotifier {
  MapType currentMapType = MapType.normal;
  Set<Marker> eventMarkers = {};
  Position currentPosition;
  LatLng center;
  bool isLoading = false;

  Completer<GoogleMapController> mapsController = new Completer();

  void displayEventMarkers() {
    eventDummy.forEach((element) {
      eventMarkers.add(
        Marker(
          markerId: MarkerId(element.title),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.title, snippet: element.description),
          position: LatLng(element.latitude, element.longitude)
        ),
      );
    });
  }

  void changeLoadingState() {
    isLoading = true;
    notifyListeners();
  }

  void mapCreated(GoogleMapController controller) {
    mapsController.complete(controller);
    notifyListeners();
  }

  void onCameraMove(CameraPosition position) {
    center = position.target;
  }

  void getLocation() async {
    await getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      currentPosition = position;
      center = LatLng(currentPosition.latitude, currentPosition.longitude);
      isLoading = true;
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> goToLocation(int index) async {
    final GoogleMapController controller = await mapsController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: center,
        zoom: 17,
        tilt: 20,
      ),
    ));
    notifyListeners();
  }
}
