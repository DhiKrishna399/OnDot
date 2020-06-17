import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import "package:project_q/models/event.dart";
import 'package:project_q/models/size_config.dart';

class DescriptionCard extends StatelessWidget {
  final Event cardEvent;

  DescriptionCard(this.cardEvent);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      height: SizeConfig.screenHeight * 0.47,
      width: SizeConfig.screenHeight * 0.35,
      //margin: EdgeInsets.only(bottom: 120),
      child: Stack(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.42,
            width: SizeConfig.screenHeight * 0.35,
            padding: EdgeInsets.only(left: 10, right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[700],
                  blurRadius: 8,
                  offset: Offset(0, 5),
                  spreadRadius: 0.9,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.close, size: 30),
                ),
                Container(
                  width: SizeConfig.screenHeight * 0.35,
                  height: SizeConfig.screenHeight * 0.12,
                  child: AutoSizeText(
                    '${cardEvent.title}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    minFontSize: 18,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: SizeConfig.screenHeight * 0.35,
                  child: Center(
                    child: AutoSizeText(
                      '${cardEvent.description}',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      minFontSize: 9,
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Spacer(),
                Center(
                  child: Container(
                    width: SizeConfig.screenWidth * 0.5,
                    height: SizeConfig.screenHeight * 0.1,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person_add),
                            SizedBox(width: 10),
                            Text('${cardEvent.numPeople}',
                                style: TextStyle(fontSize: 18)),
                            SizedBox(width: 10),
                            Text('more people welcome',
                                style: TextStyle(fontSize: 12))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.timer),
                            SizedBox(width: 10),
                            Text('${cardEvent.duration}',
                                style: TextStyle(fontSize: 18)),
                            SizedBox(width: 10),
                            Text('more minutes left',
                                style: TextStyle(fontSize: 12))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: SizeConfig.screenWidth * .18,
              width: SizeConfig.screenWidth * .18,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.orange[600]),
              child: Icon(Icons.arrow_upward, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
