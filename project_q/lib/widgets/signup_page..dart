import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key key,
    @required this.submitTotal,
    @required this.queryData,
    @required this.selectorHandler,
    @required this.mapsPageRoute,
    @required this.isLoading,
    @required this.authData,
    @required this.formKey,
  }) : super(key: key);

  final MediaQueryData queryData;
  final Function selectorHandler;
  final Function mapsPageRoute;
  final Function submitTotal;
  final bool isLoading;
  final Map<String, String> authData;
  final GlobalKey<FormState> formKey;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                          hintText: "Name",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo[900]),
                          ),
                        ),
                        validator: (value) {},
                        onSaved: (value) { },
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
                        controller: _passwordController,
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
                    Container(
                      height: 50,
                      child: TextFormField(
                          obscureText: true,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo[900]),
                            ),
                          ),
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                          }),
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
                    'Sign Up',
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
                      onPressed: () => widget.submitTotal(),
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
                    onTap: () {
                      widget.selectorHandler();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    }
}
