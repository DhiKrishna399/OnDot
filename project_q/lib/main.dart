import 'package:flutter/material.dart';
import 'package:project_q/screens/maps_page.dart';

import './screens/main_user_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ImGame",
      home: ImGame(),
    );
  }
}

class ImGame extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainUserScreen(),
      //body: MapsPage(),
    );
  }
}

