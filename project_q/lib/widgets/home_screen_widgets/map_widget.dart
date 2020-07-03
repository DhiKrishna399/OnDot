import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_q/models/size_config.dart';
import 'package:project_q/providers/maps_provider.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  void initState() {
    super.initState();    
  }
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<MapsProvider>(
      builder: (context, maps, _) {
        return GoogleMap(
          mapType: maps.currentMapType,
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
            target: maps.center,
            zoom: 19.0,
          ),
          onCameraMove: maps.onCameraMove,
          markers: maps.markers,
        );
      },
    );
  }

}
