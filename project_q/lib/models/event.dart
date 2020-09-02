import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Event {
  String title;
  String description;
  String creatorID;
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
    this.creatorID,
    this.duration,
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

class EventData {
  final String eventID;
  final String title;
  final String position;
  final String description;
  final String creatorID;
  final int numPeople;
  List<String> participants;
  int duration;

  EventData({
    this.eventID,
    this.title,
    this.description,
    this.position,
    this.numPeople,
    this.duration,
    this.creatorID,
    this.participants,
  });
}
