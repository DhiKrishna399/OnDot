import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project_q/models/event.dart';

//All methods to intereact with our firestore db
class DatabaseService {
  //uid is unique ID for the database document we are referencing
  final String uid;
  DatabaseService({this.uid});

  //Collection Reference
  final CollectionReference users = Firestore.instance.collection('users');
  final CollectionReference events = Firestore.instance.collection('events');

  //Used to create a user and to update their preferences
  /*
    * Might have to initialize a null location and events array
    * Call updateUserData again after they accept location usage
    * Then query and fill events table with a new method that takes locations
  */
  Future updateUserData(String name, String userEvent, String localEvents, String position) async {
    //return await users.document(uid).setData({'name': name});
     
      return await users.document(uid).setData({
        'name': name, 
        'myEvent' : userEvent,
        'events': events, 
        'position' : position,
        
      });

    
  }

  // return event list from event snapshot
  List<Event> _eventListSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
        return Event(
        title: doc.data['title'] ?? '',
        description: doc.data['description'] ?? '',
        position: doc.data['posiiton'] ,
        numPeople: doc.data['numPeople'] ?? 2,
        duration: doc.data['duration'] ?? 30,
        id: doc.data['id'] );
  });
  }


  //Get updates user stream (later edit to get events)
  Stream<QuerySnapshot> get userEvents {
    return users.snapshots();
  }
}
