//This is the equivalent of mainuserscreen

import 'package:flutter/material.dart';
import 'package:project_q/authentication/sign_in.dart';
import 'package:project_q/authentication/sign_up.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  //False - show signUp
  //True - show signIn
  bool userVariable = true;
  void togglePage(){
    setState(() => userVariable = !userVariable);
  }

  @override
  Widget build(BuildContext context) {
    if(userVariable){
      return SignIn(togglePage: togglePage);
    } else {
      return SignUp(togglePage: togglePage);
    }
  }
}