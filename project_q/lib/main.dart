import 'package:flutter/material.dart';
import 'package:project_q/data/db_event_list.dart';
import 'package:project_q/providers/events.dart';
import 'package:project_q/providers/maps_provider.dart';
import 'package:project_q/screens/wrapper.dart';
import 'package:project_q/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'providers/auth.dart';
import 'services/auth_service.dart';
import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Events(),
        ),
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        StreamProvider<User>.value(
          value: AuthService().user,
        ),
        ChangeNotifierProvider(
          create: (context) => MapsProvider(),
        ),
        
      
      ],
      //Check if user is logged in, boots up the app with root/routes setup
      //Make sure to set up routes and reference main_user_info.dart
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'IMGAME',
          debugShowCheckedModeBanner: false,
          home: ImGame(),
        ),
      ),
    );
  }
}

class ImGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: WillPopScope(
        onWillPop: () async => false,
        child: StreamProvider<User>.value(
          value: AuthService().user,
          child: Wrapper(),
        ),
      ),
    );
  }
}
