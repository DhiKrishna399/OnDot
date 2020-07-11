import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_q/authentication/sign_up.dart';
import 'package:project_q/models/size_config.dart';
import 'package:project_q/services/auth_service.dart';

class SignIn extends StatefulWidget {
  final Function togglePage;
  SignIn({this.togglePage});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field states
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green[50],
              Colors.tealAccent[100],
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: SizeConfig.screenHeight * 0.34,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.1),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Welcome\nBack',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: SizeConfig.screenHeight * .66,
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.screenHeight * 0.4,
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * .1),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 50,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.left,
                                cursorColor: Colors.indigo[900],
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo[900]),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty || !value.contains('@')) {
                                    return 'Invalid email!';
                                  }
                                },
                                onChanged: (value) {
                                  //setState of email var
                                  setState(() => email = value);
                                  //widget.authData['email'] = value;
                                },
                              ),
                            ),
                            Container(
                              height: 50,
                              child: TextFormField(
                                obscureText: true,
                                textAlign: TextAlign.left,
                                //controller: _passwordController,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo[900]),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter a password!';
                                  }
                                },
                                onChanged: (value) {
                                  //setState of password var
                                  setState(() => password = value);
                                  //widget.authData['password'] = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: SizeConfig.screenHeight * .13,
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * .1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            height: SizeConfig.screenWidth * .17,
                            width: SizeConfig.screenWidth * .17,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[900]),
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward),
                              color: Colors.white,
                              onPressed: () async {
                                dynamic result = await _auth.signInWithEmail_Password(email, password);
                                if( _formKey.currentState.validate()){
                                  setState(() => error = "Account invalid :(");
                                }
                                
                              }, 
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: SizeConfig.screenHeight * .13,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * .1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Text(
                              'Make a new account',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              widget.togglePage();
                            },
                          ),
                          InkWell(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
