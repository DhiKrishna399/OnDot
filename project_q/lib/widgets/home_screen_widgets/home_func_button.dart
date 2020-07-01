import 'package:flutter/material.dart';

import 'package:project_q/models/size_config.dart';
import 'package:project_q/widgets/button_widgets/maps_button.dart';


class HomeFuncButton extends StatelessWidget {
  const HomeFuncButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}