import 'package:geolocator/geolocator.dart';

class Event {
  String title;
  String description;
  int numPeople;
  int duration;
  Position position;

  Event({
    this.title,
    this.description,
    this.numPeople,
    this.duration,
    this.position
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
