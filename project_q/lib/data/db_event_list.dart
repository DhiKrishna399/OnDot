import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class dbEventList extends StatefulWidget {
  @override
  _dbEventList createState() => _dbEventList();
}

class _dbEventList extends State<dbEventList> {
  @override
  Widget build(BuildContext context) {

     //TEST CODE TO SEE IF EVENTS LOAD
    final localEvents = Provider.of<QuerySnapshot>(context);
    for(var doc in localEvents.documents){
      print(doc.data);
    }
    return Container(
       
    );
  }
}