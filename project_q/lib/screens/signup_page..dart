import 'package:flutter/material.dart';

import 'maps_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
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
          "Are You Game?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Container(
          //Email Field
          height: 50,
          width: queryData.size.width / 1.5,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            // textInputAction: TextInputAction.,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: "Enter Email",
            ),
          ),
        ),
        SizedBox(height: 10),
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
        SizedBox(height: 10),
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
              hintText: "Confirm Password",
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: queryData.size.width / 2,
          child: RaisedButton(
            onPressed: () {},
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
            selectorHandler();
          },
        ),
      ],
    );
  }
}
