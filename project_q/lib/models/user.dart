class User {
  //final String email;
  //final String password;
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String userLocation;
  final String hostEvent;
  final String joinEvent;

  UserData(
      {this.uid, this.name, this.userLocation, this.hostEvent, this.joinEvent});
}
