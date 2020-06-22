import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_q/providers/events.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';
import './screens/main_user_info.dart';
import './screens/maps_page.dart';
import './screens/settings.dart';

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
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'IMGAME',
          debugShowCheckedModeBanner: false,
          home: auth.isAuth ? MapsPage() : ImGame(),
          routes: {
            //HomePage.routeName: (ctx) => HomePage(this.googleMaps),
            MapsPage.routeName: (ctx) => MapsPage(),
            MainUserScreen.routeName: (ctx) => MainUserScreen(),
          },
        ),
      ),
    );
  }
}

class ImGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: MainUserScreen(),
        //body: MapsPage(),
      ),
    );
  }
}
