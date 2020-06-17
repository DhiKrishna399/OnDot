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
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText('Location'),
            AutoSizeText(
              '1156 High St, Santa Cruz, CA 95064',
              
            ),
          ],
        ),
      ],
    );
  }
}
