import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_q/models/user.dart';

class AuthService{

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

  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    try{

      //This signOut call is a firebase method
      print("SignedOut");
      return await _auth.signOut();
      

    } catch(e){
      print(e.toString());
      return null;
    }
  }

  
    

}