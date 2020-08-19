import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_q/models/user.dart';
import 'package:project_q/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//Stream to detect auth change for user
  Stream<User> get user {
    //stream returns fb users whenever there is an auth change
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //Register with Name, Email, and Password
  Future registerNewUser(String name, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      //Create new user into 'user' document on firebase with uid and name
      await DatabaseService(uid: user.uid)
          .updateUserData(name, null, null, "Address");

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register with Name, Email, and Password
  Future signInWithEmail_Password(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    try {
      //This signOut call is a firebase method
      print("SignedOut");
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
