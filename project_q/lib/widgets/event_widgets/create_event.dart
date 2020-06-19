import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_q/models/size_config.dart';

import '../../models/event.dart';
import '../../providers/events.dart';
import 'package:project_q/widgets/event_widgets/event_card.dart';


class CreateEvent extends StatefulWidget {
  CreateEvent({Key key}) : super(key: key);

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Dialog(

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: ConstrainedBox(
       
       
        constraints:  BoxConstraints(
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
             child: EventInfoCard(),
        ),
      ),
    );
  }

}

