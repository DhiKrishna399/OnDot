import 'package:flutter/material.dart';

import './maps_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homePage';

  final Widget googleMaps;

  HomePage(this.googleMaps);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    
    //Scaffold added
    return Scaffold(
      body: Stack(
        children: [
          widget.googleMaps,
        ],
      ),
    );
  }
}
