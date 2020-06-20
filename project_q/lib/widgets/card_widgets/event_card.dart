import 'package:flutter/material.dart';
import 'package:animated_size_and_fade/animated_size_and_fade.dart';

import "package:project_q/models/event.dart";
import "package:project_q/models/size_config.dart";
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
    SizeConfig().init(context);

    return Container(
      height: SizeConfig.screenHeight * .55,
      width: 380,
      color:Colors.red[400],
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 360,
              width: 330,
              color: Colors.red[100],
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Expanded(
                  child: GestureDetector(
                    onTap: () {
                      cardToggle();
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 700),
                      curve: Curves.easeOutCirc,
                      height: toggle ? 300 : 150,
                      width: 290,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[600],
                            blurRadius: 8,
                            offset: Offset(0, 5),
                            spreadRadius: 0.4,
                          )
                        ],
                      ),
                      child: toggle
                          ? DescriptionCard(widget.card)
                          : TitleCard(widget.card),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 220,
              height: 90,
              child: Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height: toggle ? 70 : 0,
                  width: toggle ? 70 : 0,
                  curve: Curves.ease,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange[400],
                  ),
                  child: Icon(Icons.arrow_upward,
                      color: Colors.white, size: toggle ? 25 : 0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
