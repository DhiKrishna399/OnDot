import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_q/models/event.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//All methods to intereact with our firestore db
class DatabaseService {
  //uid is unique ID for the database document we are referencing
  final String uid;
  final String eventId;
  DatabaseService({this.uid, this.eventId});

  //Collection Reference
  final CollectionReference users = Firestore.instance.collection('users');
  final CollectionReference events = Firestore.instance.collection('events');

  //Used to create a user and to update their preferences
  /*
    * Might have to initialize a null loation and events array
    * Call updateUserData again after they accept location usage
    * Then query and fill events table with a new method that takes locations
  */
  Future updateUserData(String name, Event userEvent, List<Event> localEvents, String userLocation) async {
    return await users.document(uid).setData({
      'name': name,
      'userEvent': userEvent,
      'localEvents': localEvents,
      'userLocation': userLocation,

      });
  
  }

  Future createEvent(
    String title,
    String description,
    int numPeople,
    int duration,
    String position,
  ) async {
    print('uploading data');
    return await events.document().setData({
      'title': title,
      'description': description,
      'duration': duration,
      'numPeople': numPeople,
      'position': position,
    });
  }

  // return event list from event snapshot
  List<Event> _eventListSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Event(
          title: doc.data['title'] ?? '',
          description: doc.data['description'] ?? '',
          position: doc.data['posiiton'],
          numPeople: doc.data['numPeople'] ?? 2,
          duration: doc.data['duration'] ?? 30,
          id: doc.data['id']);
    });
  }

  //Get updates user stream (later edit to get events)
  Stream<QuerySnapshot> get localEvents {
    return events.snapshots();
  }
}
