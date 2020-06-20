import 'package:flutter/material.dart';
import 'package:project_q/models/size_config.dart';


import 'package:project_q/widgets/event_widgets/event_card.dart';


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
      child: Container(
        height: SizeConfig.screenHeight * 0.62,

        //width: SizeConfig.screenWidth/ 1.15,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EventInfoCard(),
            ],
          ),
        ),
      ),
    );
  }

}

