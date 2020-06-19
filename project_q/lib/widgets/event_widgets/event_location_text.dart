import 'package:flutter/material.dart';
import 'package:project_q/models/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NewEventLocationText extends StatelessWidget {
  const NewEventLocationText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.location_on,
          size: SizeConfig.screenHeight * 0.05,
        ),
        Container(
          width: SizeConfig.screenWidth * 0.60,
          height: SizeConfig.screenHeight * 0.06,
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          // AutoSizeText(
          //   'Location',
          //   style: TextStyle(
          //     fontSize: 16,
          //   ),
          // ),
          child: AutoSizeText(
            '1156 High St UC SANTA CRUZ, Santa Cruz, CA 95064',
            style: TextStyle(fontSize: 14),
            minFontSize: 10,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          //   ],
          // ),
        ),
      ],
    );
  }
}
