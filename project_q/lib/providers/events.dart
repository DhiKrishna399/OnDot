import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import '../models/event.dart';

class Events with ChangeNotifier {
  List<Event> _activities = [];

  List<Event> get activities {
    return [..._activities];
  }

  Event findById(String id) {
    return _activities.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    const url = '';
    try{
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String,dynamic>;
      final List<Event> loadedEvents = [];
      extractedData.forEach((actId, actData) {
        loadedEvents.add(Event(
          title: actData['title'], 
          description: actData['description'], 
          numPeople: actData['numPeople'],
          position: actData['position'],
          duration: actData['duration'],
          id: actId,
        ));
      });
      _activities = loadedEvents;
      notifyListeners();
    }catch(error){
      throw (error);
    }
  }

  Future<void> addEvent(Event event) async {
    const url = 'https://project-q-v1.firebaseio.com/events.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': event.title,
          'description': event.description,
          'numPeople': event.numPeople,
          'position': event.position,
          'duration': event.duration,
        }),
      );
      final newEvent = Event(
        title: event.title,
        description: event.description,
        numPeople: event.numPeople,
        position: event.position,
        duration: event.duration,
        id: json.decode(response.body)['name'],
      );
      _activities.add(newEvent);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateEvent(String id, Event newEvent) async {
    final prodIndex = _activities.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = '';
      await http.patch(url,
        body:json.encode({
          'title': newEvent.title,
          'description': newEvent.description,
          'numPeople': newEvent.numPeople,
          'location': newEvent.position,
          'duration': newEvent.duration,
      }));
      _activities[prodIndex] = newEvent;
      notifyListeners();
    } else {
      print("...");
    }
  }

  Future<void> deleteEvent(String id) async {
    final url ='';
    final existingEventIndex = _activities.indexWhere((act)=>act.id == id);
    var existingEvent = _activities[existingEventIndex];
    _activities.removeAt(existingEventIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400){
      _activities.insert(existingEventIndex, existingEvent);
      notifyListeners();
      throw HttpException('Could not delete event.');
    }
    existingEvent = null;
  }


}
