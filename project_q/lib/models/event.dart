import 'package:flutter/foundation.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Event {
  String title;
  String description;
  String creatorID;
  final String id;
  GeoFirePoint position;
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
}

class EventData {
  final String eventID;
  final String title;
  final GeoFirePoint position;
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
