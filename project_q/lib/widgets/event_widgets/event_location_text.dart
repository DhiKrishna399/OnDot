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
          height: SizeConfig.screenHeight * 0.07,
          child: AutoSizeText(
            '1156 High Street Santa Cruz, CA 95064',
            style: TextStyle(fontSize: 16),
            minFontSize: 14,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
