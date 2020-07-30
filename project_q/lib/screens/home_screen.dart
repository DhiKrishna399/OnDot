import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:project_q/models/size_config.dart';
import 'package:project_q/providers/maps_provider.dart';
import 'package:project_q/screens/loading_screen.dart';
import 'package:project_q/services/database.dart';
import 'package:project_q/services/event_list.dart';
import 'package:project_q/widgets/event_widgets/create_event_card.dart';
import 'package:project_q/widgets/home_screen_widgets/carousel_events.dart';
import 'package:project_q/widgets/home_screen_widgets/home_func_button.dart';
import 'package:project_q/widgets/home_screen_widgets/map_widget.dart';
import 'package:provider/provider.dart';
import '../models/size_config.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<MapsProvider>(
      builder: (context, maps, _) {
        return StreamProvider<QuerySnapshot>.value(
          value: DatabaseService().userEvents,
          child: Scaffold(
            body: WillPopScope(
              onWillPop: () async => false,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: maps.isLoading
                    ? Stack(
                        children: [
                          MapWidget(),
                          HomeFuncButton(),
                          EventCarousel(),
                          EventList()
                        ],
                      )
                    : LoadingScreen(),
              ),
            ),
          ),
        );
      },
    );
  }

  // void _createNewEvent(BuildContext ctx) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return CreateEventCard();
  //       });
  // }
}
