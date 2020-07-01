import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_q/models/size_config.dart';


class MapWidget extends StatefulWidget {
  
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  MapType _currentMapType = MapType.normal;
  Set<Marker> _markers = {};
  static Position _currentPosition;
  static LatLng center;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GoogleMap(
      mapType: _currentMapType,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 19.0,
      ),
      onCameraMove: _onCameraMove,
      markers: _markers,
    );
  }

  void _onCameraMove(CameraPosition position) {
    center = position.target;
  }

  _getLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        center = LatLng(_currentPosition.latitude, _currentPosition.longitude);
        //TODO implement a boolean that can be accessed here and home_screen.dart

        //widget.isLoading = false;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
