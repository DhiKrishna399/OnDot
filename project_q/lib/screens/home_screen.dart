import 'package:flutter/material.dart';

import 'package:project_q/models/size_config.dart';
import 'package:project_q/widgets/event_widgets/create_event_card.dart';
import 'package:project_q/widgets/maps_page_widgets/map_widget.dart';
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
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: MapWidget(),
      ),
    );
  }

  void _createNewEvent(BuildContext ctx) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CreateEventCard();
        });
  }
}
