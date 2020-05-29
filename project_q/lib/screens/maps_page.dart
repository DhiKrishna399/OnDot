import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapsPage extends StatefulWidget {
  MapsPage({Key key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  //Change the appearance of map from hybrid, satellite, etc.
  MapType _currentMapType = MapType.normal;
  Set<Marker> _markers = {};
  static Position _currentPosition;
  static LatLng center;
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        loading == false
            ? GoogleMap(
                mapType: _currentMapType,
                initialCameraPosition: CameraPosition(
                  target: center,
                  zoom: 19.0,
                ),
                onCameraMove: _onCameraMove,
                markers: _markers,
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.greenAccent[400],
                child: SpinKitWave(
                  color: Colors.white,
                  type: SpinKitWaveType.start,
                ),
              ), //Add this loader to prevent error message on pop up
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "MapType",
                    onPressed: () => _onMapTypeButtonPressed(),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.map, size: 36.0),
                  ),
                  SizedBox(height: 20),
                  FloatingActionButton(
                    heroTag: "marker",
                    onPressed: _onAddMarkerButtonPressed,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.add_location, size: 36.0),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onCameraMove(CameraPosition position) {
    center = position.target;
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(center.toString()),
        position: center,
        infoWindow: InfoWindow(
          title: _currentPosition.latitude.toString() +
              ", " +
              _currentPosition.longitude.toString(),
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  _getLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        center = LatLng(_currentPosition.latitude, _currentPosition.longitude);
        loading = false;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
