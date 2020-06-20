import 'package:flutter/material.dart';

import 'package:project_q/models/size_config.dart';

import 'package:project_q/screens/settings.dart';
import 'package:project_q/widgets/event_widgets/create_event_card.dart';

class CreateEventButton extends StatelessWidget {
  const CreateEventButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CreateEventCard();
            });
      },
      child: Container(
        height: SizeConfig.screenWidth * 0.13,
        width: SizeConfig.screenWidth * 0.13,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(7)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[600],
              blurRadius: 8,
              offset: Offset(0, 0),
              spreadRadius: 0.4,
            )
          ],
        ),
        child: Icon(
          Icons.add_location,
          size: 30,
        ),
      ),
    );
  }
}


class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SettingsPage()),
        );
      },
      child: Container(
        height: SizeConfig.screenWidth * 0.07,
        width: SizeConfig.screenWidth * 0.07,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[600],
              blurRadius: 8,
              offset: Offset(0, 0),
              spreadRadius: 0.4,
            )
          ],
        ),
        child: Icon(Icons.settings, size: 18),
      ),
    );
  }
}

