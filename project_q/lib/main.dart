import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth.dart';
import './screens/main_user_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          )
        ],
        child: MaterialApp(
          title: 'IMGAME',
          home: ImGame(),
        ));
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
