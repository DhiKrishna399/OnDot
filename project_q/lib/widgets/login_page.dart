import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/maps_page.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({
    Key key,
    @required this.submitTotal,
    @required this.queryData,
    @required this.selectorHandler,
    @required this.isLoading,
    @required this.authData,
    @required this.formKey,
    @required this.mapsPageRoute
  }) : super(key: key);

  final MediaQueryData queryData;
  final Function selectorHandler;
  final Function mapsPageRoute;
  final Function submitTotal;
  final bool isLoading;
  final Map<String, String> authData; 
  final GlobalKey<FormState> formKey;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final GlobalKey<FormState> _formKey = GlobalKey();
  // Map<String, String> _authData = {
  //   'email': '',
  //   'password': '',
  // };
  // var _isLoading = false;
  final _passwordController = TextEditingController();

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

  // Future<void> _submit() async {
  //   if (!_formKey.currentState.validate()) {
  //     // Invalid!
  //     return;
  //   }
  //   _formKey.currentState.save();
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     // Log user in
  //     await Provider.of<Auth>(context, listen: false).login(
  //       _authData['email'],
  //       _authData['password'],
  //     );
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => MapsPage()),
  //     );
  //   } on HttpException catch (error) {
  //     var errorMessage = 'Authentication failed';
  //     if (error.toString().contains('EMAIL_EXISTS')) {
  //       errorMessage = 'This email address is already in use.';
  //     } else if (error.toString().contains('INVALID_EMAIL')) {
  //       errorMessage = 'This is not a valid email address';
  //     } else if (error.toString().contains('WEAK_PASSWORD')) {
  //       errorMessage = 'This password is too weak.';
  //     } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
  //       errorMessage = 'Could not find a user with that email.';
  //     } else if (error.toString().contains('INVALID_PASSWORD')) {
  //       errorMessage = 'Invalid password.';
  //     }
  //     _showErrorDialog(errorMessage);
  //   } catch (error) {
  //     const errorMessage =
  //         'Could not authenticate you. Please try again later.';
  //     _showErrorDialog(errorMessage);
  //   }

  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "Welcome Back!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
         Form(
          key: widget.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: widget.queryData.size.width / 1.5,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                        ),
                      ),
                      hintText: "Enter Email",
                    ),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                    },
                    onSaved: (value) {
                      widget.authData['email'] = value;
                    },
                  ),
                ),

                SizedBox(height: 10),
                Container(

                  height: 50,
                  width: widget.queryData.size.width / 1.5,
                  child: TextFormField(
                   obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      hintText: "Password",
                    ),
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'Password is too short!';
                      }
                    },
                    onSaved: (value) {
                      widget.authData['password'] = value;
                    },
                  ),
                ),
              ],
              ),
          ),
          ),
        SizedBox(height: 5),
        Container(
          width: widget.queryData.size.width / 2,
          child: RaisedButton(
            
            onPressed: ()=> widget.submitTotal,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10),
            ),
            child: Text("Login"),
            textColor: Colors.white,
            color: Colors.greenAccent[400],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        InkWell(
          child: new Text('New user? Sign up here'),
          onTap: () {
            widget.selectorHandler();
          },
        ),
      ],
    );
  }
}
