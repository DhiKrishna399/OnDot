import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
      {Key key,
      @required this.submitTotal,
      @required this.queryData,
      @required this.selectorHandler,
      @required this.isLoading,
      @required this.authData,
      @required this.formKey,
      @required this.mapsPageRoute})
      : super(key: key);

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
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: widget.queryData.size.height * .66,
        child: Column(
          children: [
            Container(
              height: widget.queryData.size.height * 0.4,
              padding: EdgeInsets.symmetric(
                  horizontal: widget.queryData.size.width * .1),
              child: Form(
                key: widget.formKey,
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
                            borderSide: BorderSide(color: Colors.indigo[900]),
                          ),
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
                    Container(
                      height: 50,
                      child: TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: "Password",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo[900]),
                          ),
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
            Container(
              height: widget.queryData.size.height * .13,
              padding: EdgeInsets.symmetric(
                  horizontal: widget.queryData.size.width * .1),
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
                    height: widget.queryData.size.width * .17,
                    width: widget.queryData.size.width * .17,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.indigo[900]),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.white,
                      onPressed: ()=> widget.submitTotal(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: widget.queryData.size.height * .13,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: widget.queryData.size.width * .1),
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
                    onTap: () {widget.selectorHandler();},
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
    );
  }
}
