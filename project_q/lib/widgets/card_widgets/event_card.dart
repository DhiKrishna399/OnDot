import 'package:flutter/material.dart';
import 'package:animated_size_and_fade/animated_size_and_fade.dart';

import "package:project_q/models/event.dart";
import './description_card.dart';
import './title_card.dart';

class CardEvent extends StatefulWidget {
  final Event card;

  CardEvent(this.card);

  @override
  _CardEventState createState() => _CardEventState();
}

class _CardEventState extends State<CardEvent> with TickerProviderStateMixin {
  var toggle = false;

  cardToggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cardToggle();
      },
      child: AnimatedSizeAndFade(
        vsync: this,
        child: toggle ? DescriptionCard(widget.card) : TitleCard(widget.card),
      ),
    );
  }
}
