import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import 'maps_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key key,
    @required this.queryData,
    @required this.selectorHandler,
    @required this.mapsPageRoute,
  }) : super(key: key);

  final MediaQueryData queryData;
  final Function selectorHandler;
  final Function mapsPageRoute;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
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

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    
    await Provider.of<Auth>(context, listen: false).signup(
      _authData['email'],
      _authData['password'],
    ); 
    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "Are You Game?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Form(
          key: _formKey,
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
                      _authData['email'] = value;
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
                    controller: _passwordController,
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
                      _authData['password'] = value;
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
                    hintText: "Confirm Password",
                    ),
                    validator: (value){
                      if (value != _passwordController.text) {
                        return 'Passwords do not match!';
                      }
                    }
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 10),
        Container(
          width: widget.queryData.size.width / 2,
          child: RaisedButton(
            onPressed: _submit,/*() {
                widget.mapsPageRoute();
            },*/
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10),
            ),
            child: Text("I'M GAME!"),
            textColor: Colors.white,
            color: Colors.blueAccent[400],
          ),
        ),
        SizedBox(height: 10),
        InkWell(
          child: new Text('Already have an account?'),
          onTap: () {
            widget.selectorHandler();
          },
        ),
      ],
    );
  }
}
