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
    try {
      localEvents.forEach((event) {
        print(event.title);
        print(event.description);
        print(event.creatorID);
        print(event.id);
      });
    } on Exception catch (_) {
      print("Event List Stream failed");
    }


    return Container();
  }
}
