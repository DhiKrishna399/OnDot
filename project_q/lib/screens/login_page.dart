import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key key,
    @required this.queryData,
    @required this.selectorHandler,
  }) : super(key: key);

  final MediaQueryData queryData;
  final Function selectorHandler;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "Welcome Back!",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Container(
          //Email Field
          height: 50,
          width: queryData.size.width / 1.5,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: "Enter email",
            ),
          ),
        ),
        SizedBox(height: 15),
        Container(
          //Password Field
          height: 50,
          width: queryData.size.width / 1.5,
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
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: queryData.size.width / 2,
          child: RaisedButton(
            onPressed: () {},
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
          onTap: (){ selectorHandler(); },
        ),
        
      ],
    );
  }
}