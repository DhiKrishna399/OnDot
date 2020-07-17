import 'package:cloud_firestore/cloud_firestore.dart';

//All methods to intereact with our firestore db
class DatabaseService {
  //uid is unique ID for the database document we are referencing
  final String uid;
  DatabaseService({this.uid});

  //Collection Reference
  final CollectionReference users = Firestore.instance.collection('users');

  //Used to create a user and to update their preferences
  /*
    * Migjt have to initialize a null loation and events array
    * Call updateUserData again after they accept location usage
    * Then query and fill events table with a new method that takes locations
  */
  Future updateUserData(String name) async {
    return await users.document(uid).setData({'name': name});
    /* 
      return await users.document(uid).setData({
        'name': name, 
        'myEvent' : myEvent,
        'events': events, 
        'location' : location,
        
      });

    */
  }


  //Get updates user stream (later edit to get events)
  Stream<QuerySnapshot> get userEvents {
    return users.snapshots();
  }
}
