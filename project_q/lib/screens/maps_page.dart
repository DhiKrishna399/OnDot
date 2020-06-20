import 'package:flutter/material.dart';

import 'package:project_q/models/size_config.dart';
import 'package:project_q/widgets/event_widgets/create_event.dart';
import 'package:project_q/widgets/maps_page_widgets/map_widget.dart';

import '../models/size_config.dart';
import '../widgets/event_widgets/create_event.dart';


class MapsPage extends StatefulWidget {
  static const routeName = '/mapsPage';
  MapsPage({Key key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: MapWidget(),
      
    );
  }


  void _createNewEvent(BuildContext ctx) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CreateEvent();
        });
  }
}
