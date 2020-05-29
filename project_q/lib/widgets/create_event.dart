import 'package:flutter/material.dart';

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
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                        ),
                      ),
                      hintText: "Enter Event Title",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Event title required!';
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
