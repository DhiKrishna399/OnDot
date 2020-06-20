import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import "package:project_q/models/event.dart";
import 'package:project_q/models/size_config.dart';

class TitleCard extends StatelessWidget {
  final Event cardEvent;

  TitleCard(this.cardEvent);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      child: Container(
        child: Center(
          child: AutoSizeText(
            '${cardEvent.title}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            minFontSize: 15,
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}
