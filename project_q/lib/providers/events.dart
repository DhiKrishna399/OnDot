import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import './event.dart';

class Events with ChangeNotifier{
  List<Event> _activities = [

  ];
  
  final String authToken;
  final String userId;

  Events(this.authToken, this.userId, this._activities);
  
  List<Event> get activities{
    return [..._activities];
  }

  Future<Void> addEvent(Event event) async{
    final url = 'https://project-q-v1.firebaseio.com/events.json?auth=$authToken';
    try{
      final response = await http.post(
        url,
        body: json.encode({
          'title': event.title,
          'description': event.description,
          'creatorId': userId,
        }),
      );
      final newEvent = Event(
        title: event.title,
        description: event.description,
        id: json.decode(response.body)['name'],
      );
      _activities.add(newEvent);
      notifyListeners();
    }catch (error){
      print(error);
      throw error;
    }
  }

}