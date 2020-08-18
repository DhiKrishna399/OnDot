import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../services/database.dart';

import '../../models/event.dart';
import '../../models/size_config.dart';
import 'counter.dart';
import 'event_location_text.dart';

class CreateEventCard extends StatefulWidget {
  CreateEventCard({Key key}) : super(key: key);

  @override
  _CreateEventCardState createState() => _CreateEventCardState();
}

class _CreateEventCardState extends State<CreateEventCard> {
  final _form = GlobalKey<FormState>();
  String eventName = '';
  String eventDescription = '';
  //For now using string, but should be coordinate position
  //Position eventPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  String eventLocation = '';
  int eventNumPeople = 0;
  int eventDuration = 0;

  //void _saveForm() {}

  @override
  Widget build(BuildContext context) {
    Event event;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          //color: Colors.red[300],
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          size: SizeConfig.screenHeight * 0.05,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  Form(
                    key: _form,
                    child: Column(children: <Widget>[
                      Container(
                        //color: Colors.greenAccent,
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          //initialValue: _initValues['title'],
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(50)
                          ],
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Event Title",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Event Title Required!';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() => eventName = value);
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        height: SizeConfig.screenHeight * 0.08,
                        //color: Colors.yellow,
                        child: TextFormField(
                          //initialValue: _initValues['description'],
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(150)
                          ],
                          keyboardType: TextInputType.multiline,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Activity Description",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Description required!';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() => eventDescription = value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: NewEventLocationText(),
                      ),
                      Row(
                        children: [
                          Counter(
                            count: 0,
                            onChanged: (count) =>
                                setState(() => eventDuration = count),
                          ),
                          Text(
                            'Activity Duration (min)',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: SizeConfig.screenWidth * 0.04),
                            // minFontSize: 5,
                            // stepGranularity: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Counter(
                            count: 0,
                            onChanged: (count) =>
                                setState(() => eventNumPeople = count),
                          ),
                          Text(
                            'Number of people',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: SizeConfig.screenWidth * 0.04),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.05,
                      ),
                    ]),
                  ),
                ],
              ),
              Positioned(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: IconButton(
                    iconSize: SizeConfig.screenHeight * 0.09,
                    icon: Icon(Icons.check_circle),
                    color: Colors.blue[400],
                    onPressed: () async {
                      if (_form.currentState.validate()) {
                        print('proceed to upload');
                        await DatabaseService().createEvent(
                          eventName,
                          eventDescription,
                          eventNumPeople,
                          eventDuration,
                          eventLocation,
                        );
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
                right: 0,
                left: 0,
                bottom: -34,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
