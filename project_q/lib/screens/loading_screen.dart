import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_q/providers/maps.dart';
import 'package:provider/provider.dart';


class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Provider.of<MapsProvider>(context, listen: false).getLocation();

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
