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
      width: SizeConfig.screenWidth * 0.77,
      //color: Colors.red[400],
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: SizeConfig.screenHeight * 0.45,
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
                      height: toggle
                          ? SizeConfig.screenHeight * 0.45
                          : SizeConfig.screenHeight * 0.22,
                      width: SizeConfig.screenWidth * 0.77,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
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
              width: SizeConfig.screenWidth * .2,
              height: SizeConfig.screenWidth * .27,
              child: Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: toggle ? SizeConfig.screenWidth * .19 : 0,
                  width: toggle ? SizeConfig.screenWidth * .19 : 0,
                  curve: Curves.easeOutCirc,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange[400],
                    boxShadow: [
                      BoxShadow(
                            color: Colors.grey[600],
                            blurRadius: 8,
                            offset: Offset(0, 5),
                            spreadRadius: 0.1,
                          )
                    ],
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_upward,
                        color: Colors.white, size: toggle ? 25 : 0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
