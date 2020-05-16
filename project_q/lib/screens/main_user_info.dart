import 'package:flutter/material.dart';
import 'package:project_q/screens/signup_page..dart';

import './login_page.dart';

class MainUserScreen extends StatefulWidget {
  @override
  _MainUserScreenState createState() => _MainUserScreenState();
}

class _MainUserScreenState extends State<MainUserScreen> {
  //true: login
  //false: signup
  bool userIndicator = true;

  //called whenever page needs to be switched
  void changeLogin() {
    setState(() {
      userIndicator = !userIndicator;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: userIndicator
              ? [
                  Colors.greenAccent[100],
                  Colors.greenAccent[200],
                ]
              : [
                  Colors.blue[50],
                  Colors.blue[200],
                ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 75),
              height: 125,
              width: 125,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/logo.png'))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              width: double.infinity,
              padding: EdgeInsets.only(top: 30, bottom: 20),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 30,
                      spreadRadius: 20,
                      color: Colors.blueGrey[700])
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: IntrinsicWidth(
                  child: userIndicator
                      ? LoginPage(
                          queryData: queryData,
                          selectorHandler: changeLogin,
                        )
                      : SignUpPage(
                          queryData: queryData,
                          selectorHandler: changeLogin,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
