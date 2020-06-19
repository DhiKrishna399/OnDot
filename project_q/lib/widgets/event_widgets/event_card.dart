import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../models/event.dart';
import '../../providers/events.dart';
import '../../models/size_config.dart';
import 'counter.dart';
import 'event_location_text.dart';

class EventInfoCard extends StatefulWidget {
  @override
  _EventInfoCardState createState() => _EventInfoCardState();
}

class _EventInfoCardState extends State<EventInfoCard> {
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
  void initState(){
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
    return Container(
      color: Colors.green[300],
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
            key: _form,
            child: Column(
              
              children: <Widget>[
                Container(
                  color: Colors.red[300],
                  height: SizeConfig.screenHeight * 0.08,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    initialValue: _initValues['title'],
                    inputFormatters: [new LengthLimitingTextInputFormatter(50)],
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Enter Event Title",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Event title required!';
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
                Container(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  height: SizeConfig.screenHeight * 0.08,
                  color: Colors.yellow,
                  child: TextFormField(
                    initialValue: _initValues['description'],
                    inputFormatters: [new LengthLimitingTextInputFormatter(150)],
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
                      style: TextStyle(fontSize: SizeConfig.screenWidth * 0.04),
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
                      style: TextStyle(fontSize: SizeConfig.screenWidth * 0.04),
                      //minFontSize: 5,
                      //stepGranularity: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                
                Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: IconButton(
                    iconSize: SizeConfig.screenHeight * 0.09,
                    icon: Icon(Icons.check_circle),
                    color: Colors.blue[400],
                    onPressed: _saveForm,
                  ),
                ),
                // onTap: Event(
                //     title: "t",
                //     description: "d",
                //     position: "",
                //     numPeople: 3,
                //     duration: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
