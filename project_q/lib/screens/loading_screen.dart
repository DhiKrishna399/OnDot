import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_q/providers/maps_provider.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {

  const LoadingScreen({
    Key key,
  }) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    print('BUILD ');
    Provider.of<MapsProvider>(context, listen: false).getLocation();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.greenAccent[400],
      child: SpinKitWave(
        color: Colors.white,
        type: SpinKitWaveType.start,
      ),
    );
  }
}
