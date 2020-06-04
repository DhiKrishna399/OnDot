import 'package:flutter/material.dart';

import './maps_page.dart';

class HomePage extends StatefulWidget {

  final Widget googleMaps;

  HomePage(this.googleMaps);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.googleMaps,
      ],   
    );
  }
}
