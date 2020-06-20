import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../models/event.dart';
import '../../providers/events.dart';
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
  var _editedEvent = Event(
    title: '',
    description: '',
    id: null,
  );
  var _initValues = {
    'title': '',
    'description': '',
  };
  var _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _editedEvent =
            Provider.of<Events>(context, listen: false).findById(productId);
        _initValues = {
          'title': _editedEvent.title,
          'description': _editedEvent.description,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (_editedEvent.id != null) {
      Provider.of<Events>(context, listen: false)
          .updateEvent(_editedEvent.id, _editedEvent);
    } else {
      Provider.of<Events>(context, listen: false).addEvent(_editedEvent);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Container(
                      //color: Colors.greenAccent,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        initialValue: _initValues['title'],
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
                        onSaved: (value) {
                          _editedEvent = Event(
                            title: value,
                            description: _editedEvent.description,
                            id: _editedEvent.id,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    height: SizeConfig.screenHeight * 0.08,
                    //color: Colors.yellow,
                    child: TextFormField(
                      initialValue: _initValues['description'],
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
                      onSaved: (value) {
                        _editedEvent = Event(
                          title: _editedEvent.title,
                          description: value,
                          id: _editedEvent.id,
                        );
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
                      ),
                      Text(
                        'Activity Duration (min)',
                        maxLines: 1,
                        style:
                            TextStyle(fontSize: SizeConfig.screenWidth * 0.04),
                        // minFontSize: 5,
                        // stepGranularity: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Counter(
                        count: 2,
                      ),
                      Text(
                        'Number of people',
                        maxLines: 1,
                        style:
                            TextStyle(fontSize: SizeConfig.screenWidth * 0.04),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.05,),
                ],
              ),
              Positioned(
                              child: Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: IconButton(
                    iconSize: SizeConfig.screenHeight * 0.09,
                    icon: Icon(Icons.check_circle),
                    color: Colors.blue[400],
                    onPressed: _saveForm,
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