import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';


class EventList extends StatefulWidget {
  EventList({Key key}) : super(key: key);

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {

    final userEvents = Provider.of<QuerySnapshot>(context);
    //print(userEvents.documents);
    for (var doc in userEvents.documents){
      print(doc.data);
    }
    return Container(
       
    );
  }
}
