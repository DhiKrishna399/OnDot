import 'package:flutter/material.dart';
import 'package:project_q/models/size_config.dart';
import 'counter.dart';
import 'event_location_text.dart';

class EventInfoCard extends StatefulWidget {
  EventInfoCard({Key key}) : super(key: key);

  @override
  _EventInfoCardState createState() => _EventInfoCardState();
}

class _EventInfoCardState extends State<EventInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.close,
                    size: SizeConfig.screenHeight * 0.05,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, right: 25),
                child: Form(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: "What's the activity title?",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Event title required!';
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0, right: 25),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: "Describe the activity in a few words",
                    hintStyle: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: NewEventLocationText(),
              ),
              Row(
                children: [
                  Counter(count: 0,),
                  Text('Activity Duration (min)'),
                ],
              ),
              Row(
                children: [
                  Counter(count: 2,),
                  Text('Number of people'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}