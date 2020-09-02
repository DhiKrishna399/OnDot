
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_q/models/event.dart';
import 'package:provider/provider.dart';

class dbEventList extends StatefulWidget {
  @override
  _dbEventList createState() => _dbEventList();
}

class _dbEventList extends State<dbEventList> {
  @override
  Widget build(BuildContext context) {

     //TEST CODE TO SEE IF EVENTS LOAD
    final localEvents = Provider.of<List<Event>>(context);
    localEvents.forEach((event) {
      print(event.title);
      print(event.description);
      print(event.numPeople);
      print(event.duration);
      print(event.position);
      print(event.id);

    });
    return Container(
       
    );
  }
}