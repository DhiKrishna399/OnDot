import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


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
  MediaQueryData queryData;


  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return loading == false
        ? Stack(
            children: [
              GoogleMap(
                mapType: _currentMapType,
                initialCameraPosition: CameraPosition(
                  target: center,
                  zoom: 19.0,
                ),
                onCameraMove: _onCameraMove,
                markers: _markers,
                myLocationButtonEnabled: false,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: (queryData.size.height) * .40,
                  decoration: BoxDecoration(
                    //border: Border.all(width: 3)
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: (queryData.size.height) * .18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                            color: Colors.white
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: double.infinity,
                          height: (queryData.size.height) * .34,
                          //color: Colors.green[100]
                          child: Swiper(
                            itemCount: 5,
                            viewportFraction: 0.6,
                            scale: 0.8,
                            fade: 0.8,
                            loop: false,
                            index: 0,
                            itemBuilder: (context, index){
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  
                ),
              ),
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
          )
        : Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.greenAccent[400],
            child: SpinKitWave(
              color: Colors.white,
              type: SpinKitWaveType.start,
            ),
          ); //Add this loader to prevent error message on pop up
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
