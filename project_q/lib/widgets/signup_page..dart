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
                      widget.authData['password'] = value;
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
        SizedBox(height: 10),
        Container(
          width: widget.queryData.size.width / 2,
          child: RaisedButton(
            onPressed: () => widget.submitTotal(),
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
