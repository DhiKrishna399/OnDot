import 'dart:convert';
import 'dart:ffi';

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

  void addEvent(Event event) {
    const url = 'https://project-q-v1.firebaseio.com/events.json';
    http
        .post(
      url,
      body: json.encode({
        'title': event.title,
        'description': event.description,
      }),
    )
        .then((response) {
      final newEvent = Event(
        title: event.title,
        description: event.description,
        id: json.decode(response.body)['name'],
      );
      _activities.add(newEvent);
      notifyListeners();
    });
  }

  void updateEvent(String id, Event newEvent) {
    final prodIndex = _activities.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _activities[prodIndex] = newEvent;
      notifyListeners();
    } else {
      print("...");
    }
  }
}
