import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Event {
  String title;
  String description;
  final String id;
  Position position;
  int numPeople;
  int duration;
  LatLng locationCoords;

  Event({
    @required this.title,
    @required this.description,
    @required this.id,
    this.position,
    this.numPeople,
    this.duration,
    this.locationCoords,
  });

  void setTitle(String t) {
    title = t;
  }

  void setDescription(String d) {
    description = d;
  }

  void setNumPeople(int n) {
    numPeople = n;
  }

  void setDuration(int s) {
    duration = s;
  }

  void setPosition(Position p) {
    position = p;
  }
}
