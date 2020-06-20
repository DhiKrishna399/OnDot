import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:project_q/models/size_config.dart';
import 'package:project_q/screens/settings.dart';
import 'package:project_q/widgets/event_widgets/create_event.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../models/size_config.dart';
import '../models/event_dummy.dart';
import '../widgets/event_widgets/create_event.dart';
import '../widgets/button_widgets/maps_button.dart';
import '../widgets/card_widgets/event_card.dart';
import './loading_screen.dart';


class MapsPage extends StatefulWidget {
  static const routeName = '/mapsPage';
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
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: loading == false
          ? Stack(
              children: [
                GoogleMap(
                  mapType: _currentMapType,
                  myLocationButtonEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: center,
                    zoom: 19.0,
                  ),
                  onCameraMove: _onCameraMove,
                  markers: _markers,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: SizeConfig.screenHeight * 0.15,
                    width: SizeConfig.screenWidth * 0.15,
                    margin: EdgeInsets.only(
                      top: SizeConfig.screenWidth * 0.07,
                      right: SizeConfig.screenWidth * 0.04,
                    ),
                    child: Column(
                      children: [
                        CreateEventButton(),
                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                        SettingsButton(),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                    child: Container(
                    height: 400,
                    child: CardEvent(eventDummy[2]),
                    // child: Swiper(
                    //     itemCount: eventDummy.length,
                    //     scale: 0.80,
                    //     viewportFraction: 0.66,
                    //     itemBuilder: (context, index) {
                    //       return CardEvent(eventDummy[index]);
                          
                    //     },
                    //   ),
                  ),
                ),
                
              ],
            )
          : LoadingScreen(), //Add this loader to prevent error message on pop up
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

  void _createNewEvent(BuildContext ctx) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CreateEvent();
        });
  }
}
