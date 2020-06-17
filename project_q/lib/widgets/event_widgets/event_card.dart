import 'package:flutter/material.dart';
import 'package:project_q/models/event.dart';
import 'package:project_q/models/global.dart';
import 'package:project_q/models/size_config.dart';
import 'counter.dart';
import 'event_location_text.dart';

class EventInfoCard extends StatefulWidget {
  EventInfoCard({
    Key key,
    @required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

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
          Form(
            //CHECK WITH MYLES ABOUT HOW THIS WORKS
            key: widget.formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Enter Event Title",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Event title required!';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Activity Description",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: NewEventLocationText(),
                ),
                Row(
                  children: [
                    Counter(
                      count: 0,
                    ),
                    Text('Activity Duration (min)'),
                  ],
                ),
                Row(
                  children: [
                    Counter(
                      count: 2,
                    ),
                    Text('Number of people'),
                  ],
                ),
                GestureDetector(
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.blue[400],
                    size: SizeConfig.screenHeight * 0.10,
                  ),
                  // onTap: Event(
                  //     title: "t",
                  //     description: "d",
                  //     position: "",
                  //     numPeople: 3,
                  //     duration: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
