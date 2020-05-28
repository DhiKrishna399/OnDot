import 'package:flutter/material.dart';
import 'package:project_q/widgets/signup_page..dart';
import 'package:provider/provider.dart';

import '../widgets/login_page.dart';
import 'maps_page.dart';
import '../screens/maps_page.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';


class MainUserScreen extends StatefulWidget {
  @override
  _MainUserScreenState createState() => _MainUserScreenState();
}

class _MainUserScreenState extends State<MainUserScreen> {
  //true: login
  //false: signup
  bool userIndicator = true;
  GlobalKey<FormState> formKey = GlobalKey();
  var isLoading = false;
  Map<String, String> authData = {
    'email': '',
    'password': '',
  };

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  //called whenever page needs to be switched
  Future<void> _submit() async {
    if (!formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    formKey.currentState.save();
    setState(() {
      isLoading = true;
    });
    try {
      // Log user in
      if(userIndicator == true){
        await Provider.of<Auth>(context, listen: false).login(
          authData['email'],
          authData['password'],
        );
      }else{
        await Provider.of<Auth>(context, listen: false).signup(
          authData['email'],
          authData['password'],
        );
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapsPage()),
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      isLoading = false;
    });
  }

  void changeLogin() {
    setState(() {
      userIndicator = !userIndicator;
    });
  }

  void loadMaps() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapsPage()),
    );
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
                          mapsPageRoute: loadMaps,
                          authData: authData,
                          formKey: formKey,
                          submitTotal: _submit,
                          isLoading: isLoading,
                        )
                      : SignUpPage(
                          queryData: queryData,
                          selectorHandler: changeLogin,
                          mapsPageRoute: loadMaps,
                          authData: authData,
                          formKey: formKey,
                          submitTotal: _submit,
                          isLoading: isLoading,

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
