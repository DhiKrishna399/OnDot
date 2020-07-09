
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_q/services/auth_service.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: RaisedButton(
          child: Text("Sign In"),
          onPressed: () async {
            //signInAnon() is Future so we need to wait for it to complete
            dynamic result = await _auth.signInAnon();
            if(result == null){
              print("Sign in anon failed");
            } else {
              print(result.uid);
            }
          }),
      ),
    );
  }
}
