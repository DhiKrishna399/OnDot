import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_q/models/event.dart';
import 'package:project_q/models/user.dart';

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
  Future updateUserData(String name, String hostEvent, String joinEvents,
      String userLocation) async {
    return await users.document(uid).setData({
      'name': name,
      'hostEvent': hostEvent,
      'joinEvents': joinEvents,
    });
  }

  Future createEvent(
    String title,
    String description,
    int numPeople,
    int duration,
    //GeoPoint position,
    String creatorID,
    List<String> participants,
    double latitude,
    double longitude,
  ) async {
    print('uploading data');
    return await events.add({
      'title': title,
      'description': description,
      'duration': duration,
      'numPeople': numPeople,
      'creatorID': creatorID,
      'participants': participants,
      'latitude': latitude,
      'longitude': longitude
    });
  }

  // return event list from event snapshot
  List<Event> _eventListSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Event(
          title: doc.data['title'] ?? '',
          description: doc.data['description'] ?? '',
          //position: doc.data['position'] ?? null,
          latitude: doc.data['latitude'] ?? null,
          longitude: doc.data['longitude'] ?? null,
          numPeople: doc.data['numPeople'] ?? 2,
          duration: doc.data['duration'] ?? 30,
          creatorID: doc.data['creatorID'] ?? null,
          id: doc.data['id']);
    }).toList();
  }

  //Get updates user stream (later edit to get events)
  //Stream<QuerySnapshot> get localEvents {
  //return events.snapshots();
  //}

  UserData _userData(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      userLocation: snapshot.data['userLocation'],
      joinEvent: snapshot.data['joinEvent'],
      hostEvent: snapshot.data['hostEvent'],
    );
  }

  Stream<List<Event>> get eventlist {
    return events.snapshots().map(_eventListSnapshot);
  }

  Stream<UserData> get userData {
    return users.document(uid).snapshots().map(_userData);
  }
}
