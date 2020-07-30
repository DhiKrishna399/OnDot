import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';


class Event {
  String title;
  String description;
  final String id;
  Position position;
  int numPeople;
  int duration;
  

  Event({
    @required this.title,
    @required this.description,
    @required this.position,
    @required this.id,
    @required this.numPeople,
    @required this.duration,
   
  });

  void setTitle(String t){
    title = t;
  }

  void setDescription(String d){
    description = d;
  }

  void setNumPeople(int n){
    numPeople = n;
  }

  void setDuration(int s){
    duration = s;
  }

  void setPosition(Position p){
    position = p;
  }

  
}
