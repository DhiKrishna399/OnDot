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

    return SingleChildScrollView(
      child: Container(
        height: 300,
        width: 290,
        color: Colors.blue[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.close, size: 30),
            ),
            Container(
              //width: SizeConfig.screenHeight * 0.35,
              height: SizeConfig.screenHeight * 0.12,
              padding: EdgeInsets.only(left: 15, right: 18),
              //color:Colors.red,
              child: AutoSizeText(
                '${cardEvent.title}',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                minFontSize: 23,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              height: SizeConfig.screenHeight * 0.09,
              padding: EdgeInsets.only(left: 15, right: 18),
              //color: Colors.yellow[100],
              child: AutoSizeText(
                  '${cardEvent.description}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  minFontSize: 12,
                  maxLines: 4,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                ),
            ),
           Spacer(),
            Container(
              padding: EdgeInsets.only(left: 40),
              margin: EdgeInsets.only(bottom: 55),
              height: SizeConfig.screenHeight * 0.08,
              color: Colors.purple[100],
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_add),
                      SizedBox(width: 10),
                      AutoSizeText(
                        '${cardEvent.numPeople}',
                        style: TextStyle(fontSize: 18),
                        minFontSize: 6,
                        overflow: TextOverflow.fade,
                      ),
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
                      Text('more minutes left', style: TextStyle(fontSize: 12))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
