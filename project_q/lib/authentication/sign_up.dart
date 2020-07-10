import 'package:flutter/material.dart';
import 'package:project_q/models/size_config.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              Colors.yellow[50],
              Colors.yellow[200],
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
                    "Create\nAccount",
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
                        //key: widget.formKey,
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
                                  hintText: "Name",
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigo[900]),
                                  ),
                                ),
                                validator: (value) {},
                                onSaved: (value) {},
                              ),
                            ),
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
                                onSaved: (value) {
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
                                  if (value.isEmpty || value.length < 5) {
                                    return 'Password is too short!';
                                  }
                                },
                                onSaved: (value) {
                                  //widget.authData['password'] = value;
                                },
                              ),
                            ),
                            Container(
                              height: 50,
                              child: TextFormField(
                                  obscureText: true,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.indigo[900]),
                                    ),
                                  ),
                                  validator: (value) {
                                    // if (value != _passwordController.text) {
                                    //   return 'Passwords do not match!';
                                    // }
                                  }),
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
                            'Sign Up',
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
                              //onPressed: () => widget.submitTotal(),
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
                              'Already have an account',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () => Navigator.pop(context),
                          ),
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
