import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_q/models/event_dummy.dart';
import 'package:project_q/models/size_config.dart';
import 'package:project_q/screens/loading_screen.dart';
import 'package:project_q/widgets/button_widgets/maps_button.dart';
import 'package:project_q/widgets/card_widgets/event_card.dart';

class MapWidget extends StatefulWidget {
  MapWidget({Key key}) : super(key: key);

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
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
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
                    height: 320,
                    child: Swiper(
                      itemCount: eventDummy.length,
                      scale: 0.80,
                      viewportFraction: 0.66,
                      itemBuilder: (context, index) {
                        return CardEvent(eventDummy[index]);
                      },
                    ),
                  ),
                ),
              ],
            )
          : LoadingScreen(), //Add this loader to
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
        loading = false;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
